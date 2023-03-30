import 'package:artdesign/app/core/conditional/browser_conditional.dart';
import 'package:artdesign/app/core/conditional/conditional.dart';
import 'package:artdesign/app/presentation/home/home_controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class SwiperWidget extends GetView<HomeController> {
  const SwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.bannerState.value) {
        case ViewState.busy:
          return core_widgets.ShimmerWidget(height: 150, width: Get.width);

        case ViewState.error:
          return Container(
            height: 150,
          );

        case ViewState.data:
          return SizedBox(
            height: 150,
            child: Swiper(
              itemBuilder: (context, index) {
                final image = controller.sliders[index].image;
                return Stack(
                  children: [
                    Positioned.fill(
                        child: FadeInImage(
                      fadeInDuration: const Duration(milliseconds: 200),
                      placeholder: BrowserConditional().getProvider(''),
                      image: Conditional().getProvider(image!),
                      fit: BoxFit.cover,
                    )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(.1),
                            Colors.black12,
                            Colors.grey.withOpacity(.1),
                          ],
                        )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.sliders[index].title!,
                              style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            Visibility(
                              visible: controller
                                  .sliders[index].subtitle!.isNotEmpty,
                              child: Text(
                                controller.sliders[index].subtitle!,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: ElevatedButton(
                                  onPressed: () {
                                    debugPrint('disini');
                                  },
                                  child: Text(
                                    controller.sliders[index].button!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                            ),
                          ],
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 22,
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(.1),
                            Colors.black54,
                            Colors.grey.withOpacity(.1),
                          ],
                        )),
                        child: Text(
                          controller.sliders[index].desc!,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ],
                );
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              itemCount: controller.sliders.length,
              pagination: const SwiperPagination(
                  margin: EdgeInsets.all(4.0),
                  alignment: Alignment.bottomRight),
              control: SwiperControl(
                  iconPrevious: CupertinoIcons.arrow_left_square_fill,
                  iconNext: CupertinoIcons.arrow_right_square_fill,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          );

        default:
          return core_widgets.ShimmerWidget(height: 150, width: Get.width);
      }
    });
  }
}
