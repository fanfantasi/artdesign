import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/presentation/professional/professional_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;
import '../../core/widgets/index.dart' as core_widgets;
import 'widgets/professionalgrid.dart';
import 'widgets/professionallist.dart';

class ProfessionalScreen extends GetView<ProfessionalController> {
  const ProfessionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 32,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        title: Text(
          'all professional'.tr(),
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Image.asset(
                'assets/icons/ic-search.png',
                width: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        switch (controller.setState.value) {
          case ViewState.busy:
            return const core_widgets.LoadingWidget();

          case ViewState.error:
            return Container(
              height: 210,
            );

          case ViewState.data:
            return Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(.2),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          offset: const Offset(
                            1.0,
                            1.0,
                          ),
                        )
                      ],
                    ),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          core_widgets.ActionButton(
                            title: 'Filter',
                            iconPath: CupertinoIcons.slider_horizontal_3,
                            onTap: () {
                              controller.setViewSection(ViewSection.filter);
                            },
                            active: controller.viewSection.value ==
                                ViewSection.filter,
                          ),
                          const VerticalDivider(),
                          core_widgets.ActionButton(
                            title: 'Sort',
                            iconPath: (controller.sortUp.value)
                                ? CupertinoIcons.sort_up
                                : CupertinoIcons.sort_down,
                            onTap: () {
                              controller.sortUp.value =
                                  !controller.sortUp.value;
                              controller.setViewSection(ViewSection.sort);
                              controller.sortItems();
                            },
                            active: controller.viewSection.value ==
                                ViewSection.sort,
                          ),
                          const VerticalDivider(),
                          core_widgets.ActionButton(
                            title:
                                (controller.gridOrList.value) ? 'Grid' : 'List',
                            iconPath: (controller.gridOrList.value)
                                ? CupertinoIcons.square_grid_2x2
                                : CupertinoIcons.list_bullet,
                            active: controller.viewSection.value ==
                                ViewSection.gridorlist,
                            onTap: () {
                              controller.setViewSection(ViewSection.gridorlist);
                              controller.gridOrList.value =
                                  !controller.gridOrList.value;
                            },
                          )
                        ],
                      ),
                    )),
                Expanded(
                  child: MasonryGridView.count(
                      controller: controller.scrollController,
                      crossAxisCount: (controller.gridOrList.value) ? 2 : 1,
                      mainAxisSpacing: 9 / 6,
                      crossAxisSpacing: 9 / 6,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8.0),
                      itemCount: controller.professionals.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Obx(
                            () => (controller.gridOrList.value)
                                ? ProfessionalGridWidget(
                                    resultProfessional:
                                        controller.professionals[index],
                                  )
                                : ProfessionalListWidget(
                                    resultProfessional:
                                        controller.professionals[index],
                                  ),
                          ))),
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
