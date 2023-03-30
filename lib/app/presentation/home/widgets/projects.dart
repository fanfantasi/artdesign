import 'package:artdesign/app/core/routes/app_pages.dart';
import 'package:artdesign/app/presentation/home/home_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conditional/browser_conditional.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class ProjectWidget extends GetView<HomeController> {
  const ProjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.projectState.value) {
        case ViewState.busy:
          return const core_widgets.LoadingWidget();

        case ViewState.error:
          return Container(
            height: 210,
          );

        case ViewState.data:
          return ListView.builder(
            itemCount: controller.projects.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return InkResponse(
                onTap: () => Get.toNamed(Routes.projectdetail,
                    arguments: controller.projects[i]),
                child: Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag:
                            'project-${controller.projects[i].imageProject!.thumbnail!}',
                        child: Container(
                          width: Get.width / 2.2,
                          height: 110,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(.2),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: const Offset(
                                  1.0,
                                  2.0,
                                ),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(4),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: controller
                                    .projects[i].imageProject!.thumbnail!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: Get.width / 6.85,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(4),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: controller.projects[i].imageProject!
                                        .image![index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2.2,
                        child: AutoSizeText(
                          '${controller.projects[i].title}',
                          maxFontSize: 16,
                          minFontSize: 12,
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
                          '${controller.projects[i].professional}',
                          maxFontSize: 16,
                          minFontSize: 12,
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
                ),
              );
            },
          );
        default:
          return const core_widgets.LoadingWidget();
      }
    });
  }
}
