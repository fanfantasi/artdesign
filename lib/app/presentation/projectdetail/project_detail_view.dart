import 'package:artdesign/app/core/conditional/conditional.dart';
import 'package:artdesign/app/presentation/projectdetail/project_detail_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/constants.dart';
import '../../core/widgets/index.dart' as core_widgets;
import 'widgets/contact.dart';
import 'widgets/project.dart';

class ProjectDetailViewScreen extends GetView<ProjectDetailController> {
  const ProjectDetailViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        switch (controller.setState.value) {
          case ViewState.busy:
            return const core_widgets.LoadingWidget();

          case ViewState.error:
            return const core_widgets.ErrorWidget();

          case ViewState.data:
            return Stack(
              children: [
                CustomScrollView(
                  controller: controller.scrollViewController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: core_widgets.SliverCustomHeaderDelegate(
                          collapsedHeight: 60,
                          expandedHeight: 250,
                          paddingTop: 20,
                          title: controller.projectsModel!.title!,
                          subtitle: controller.projectsModel!.professional!,
                          type: ViewType.projects,
                          image: controller
                              .projectsModel!.imageProject!.thumbnail!,
                          images: controller.images,
                          logo: controller.projectsModel!.logo,
                          tagHero:
                              'project-${controller.projectsModel!.imageProject!.thumbnail!}'),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                controller.projectsModel!.detailProject!.type!,
                                maxFontSize: 20,
                                minFontSize: 18,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AutoSizeText(
                                controller
                                    .projectsModel!.detailProject!.location!,
                                maxFontSize: 16,
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => SizedBox(
                                width: Get.width * .50,
                                height: 32,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkResponse(
                                      splashColor: Colors.transparent,
                                      onTap: () => controller
                                          .setViewProject(ViewProject.detail),
                                      child: SizedBox(
                                        height: 32,
                                        width: Get.width / 6,
                                        child: Row(
                                          children: [
                                            controller.viewSection.value ==
                                                    ViewProject.detail
                                                ? Icon(
                                                    Icons
                                                        .check_circle_outline_outlined,
                                                    color: Theme.of(context)
                                                        .primaryColor)
                                                : Icon(Icons.circle_outlined,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface),
                                            Text(
                                              'Detail',
                                              style: TextStyle(
                                                  color: controller.viewSection
                                                              .value ==
                                                          ViewProject.detail
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .surface),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkResponse(
                                      splashColor: Colors.transparent,
                                      onTap: () => controller
                                          .setViewProject(ViewProject.contact),
                                      child: SizedBox(
                                        height: 32,
                                        width: Get.width / 5,
                                        child: Row(
                                          children: [
                                            controller.viewSection.value ==
                                                    ViewProject.contact
                                                ? Icon(
                                                    Icons
                                                        .check_circle_outline_outlined,
                                                    color: Theme.of(context)
                                                        .primaryColor)
                                                : Icon(Icons.circle_outlined,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface),
                                            Text(
                                              'Contact',
                                              style: TextStyle(
                                                  color: controller.viewSection
                                                              .value ==
                                                          ViewProject.contact
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .surface),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: InkResponse(
                                        child: Icon(
                                      Icons.bookmark_border_outlined,
                                      size: 32,
                                      color: Theme.of(context).primaryColor,
                                    )),
                                  )))
                        ],
                      ),
                      const Divider(
                        thickness: .5,
                      ),
                      controller.viewSection.value == ViewProject.detail
                          ? ProjectWidget(
                              projectDetail: controller.projectsModel!,
                            )
                          : const ContactWidget(),
                      const Divider(
                        thickness: .5,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Company Detail',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 6,
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: Conditional()
                                          .getProvider(
                                              controller.projectsModel!.logo!),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.projectsModel!.professional!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Design and Builds',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.0,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/ic-pin.png',
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Villa Bukit Mas RC-29, Surabaya',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.0,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/ic-phone.png',
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'View phone number',
                                    style: TextStyle(
                                        fontSize: 14,
                                        foreground: Paint()
                                          ..style = PaintingStyle.fill
                                          ..color = Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                          ..maskFilter = const MaskFilter.blur(
                                              BlurStyle.normal, 3)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.0,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/ic-fb.png',
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Text(
                                    '+62-*********89',
                                    style: TextStyle(
                                        fontSize: 14,
                                        foreground: Paint()
                                          ..style = PaintingStyle.fill
                                          ..color = Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                          ..maskFilter = const MaskFilter.blur(
                                              BlurStyle.normal, 3)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.0,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/ic-wa.png',
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Text(
                                    '+62-*********89',
                                    style: TextStyle(
                                        fontSize: 14,
                                        foreground: Paint()
                                          ..style = PaintingStyle.fill
                                          ..color = Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                          ..maskFilter = const MaskFilter.blur(
                                              BlurStyle.normal, 3)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ]))
                  ],
                ),
              ],
            );
          default:
            return const core_widgets.LoadingWidget();
        }
      }),
    );
  }
}
