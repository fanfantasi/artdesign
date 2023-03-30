import 'package:artdesign/app/presentation/home/home_controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conditional/browser_conditional.dart';
import '../../../core/config/constants.dart';
import '../../../core/config/formatter.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class EventWidget extends GetView<HomeController> {
  const EventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.projectState.value) {
        case ViewState.busy:
          return const core_widgets.LoadingWidget();

        case ViewState.error:
          return Container(
            height: 82,
          );

        case ViewState.data:
          return SizedBox(
            height: 82,
            child: Swiper(
              indicatorLayout: PageIndicatorLayout.NONE,
              autoplay: false,
              itemCount: controller.events.length,
              pagination: const SwiperPagination(
                  margin: EdgeInsets.all(4.0),
                  alignment: Alignment.bottomRight),
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(12),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: controller.events[i].image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 32,
                        width: Get.width,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                            Colors.transparent,
                          ],
                        )),
                        child: Column(
                          children: [
                            Text(
                              controller.events[i].title!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            Text(
                              Formatter.dateformat(controller.event[i].date!),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        default:
          return const core_widgets.LoadingWidget();
      }
    });
  }
}
