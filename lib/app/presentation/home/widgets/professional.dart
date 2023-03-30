import 'package:artdesign/app/presentation/home/home_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/conditional/browser_conditional.dart';
import '../../../core/conditional/conditional.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class ProfessionalWidget extends GetView<HomeController> {
  const ProfessionalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.professionalState.value) {
        case ViewState.busy:
          return const core_widgets.LoadingWidget();

        case ViewState.error:
          return Container(
            height: 170,
          );

        case ViewState.data:
          return ListView.builder(
              itemCount: controller.professionals.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 72,
                            width: Get.width / 2.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(4),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image:
                                      controller.professionals[i].background!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Conditional().getProvider(
                                        controller.professionals[i].logo!),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                      SizedBox(
                        width: Get.width / 2.2,
                        child: AutoSizeText(
                          '${controller.professionals[i].title}',
                          maxFontSize: 14,
                          minFontSize: 10,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2.2,
                        child: AutoSizeText(
                          '${controller.professionals[i].city}',
                          maxFontSize: 14,
                          minFontSize: 10,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                );
              });

        default:
          return const core_widgets.LoadingWidget();
      }
    });
  }
}
