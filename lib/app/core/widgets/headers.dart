import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/core/widgets/images_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../conditional/browser_conditional.dart';
import '../conditional/conditional.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String title;
  final String subtitle;
  final String image;
  final List<String>? images;
  final String tagHero;
  final ViewType type;
  final String? logo;

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.title,
    required this.subtitle,
    required this.image,
    this.images,
    required this.tagHero,
    required this.type,
    this.logo,
  });

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 100, 100, 100);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (shrinkOffset <= 50)
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.transparent,
        height: maxExtent,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Stack(
              clipBehavior: Clip.none,
              // overflow: Overflow.visible,
              children: [
                SizedBox(
                  height: maxExtent,
                  width: Get.width,
                  child: (type == ViewType.projects)
                      ? Swiper(
                          autoplay: false,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                    ImagesView(images: images!, title: title),
                                    arguments: images![i]);
                              },
                              child: Hero(
                                  tag: 'zoom' + images![i],
                                  transitionOnUserGestures: true,
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: images![i],
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                          itemCount: images!.length,
                          loop: false,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomRight,
                              builder: SwiperPagination.dots,
                              margin: EdgeInsets.only(bottom: 40, right: 8)),
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.to(ImagesView(images: [image], title: title),
                                arguments: image);
                          },
                          child: Hero(
                            tag: 'zoom' + image,
                            transitionOnUserGestures: true,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 64,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.transparent,
                        ],
                      )),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                maxFontSize: 22,
                                minFontSize: 16,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Visibility(
                                visible: type == ViewType.projects,
                                child: AutoSizeText(
                                  subtitle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  maxFontSize: 16,
                                  minFontSize: 14,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )),
                    )),
                Visibility(
                  visible: type == ViewType.projects,
                  child: Positioned(
                      bottom: -40,
                      right: 10,
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: Conditional().getProvider(logo!),
                        ),
                      )),
                )
              ],
            ),
            // Put your head back
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: makeStickyHeaderBgColor(shrinkOffset),
                ),
                child: SafeArea(
                  bottom: false,
                  child: SizedBox(
                    height: collapsedHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6.0),
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              CupertinoIcons.chevron_back,
                              color:
                                  makeStickyHeaderTextColor(shrinkOffset, true),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          width: Get.width * .75,
                          child: AutoSizeText(
                            title,
                            maxFontSize: 16,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: makeStickyHeaderTextColor(
                                  shrinkOffset, false),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6.0),
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              CupertinoIcons.arrowshape_turn_up_right,
                              color:
                                  makeStickyHeaderTextColor(shrinkOffset, true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
