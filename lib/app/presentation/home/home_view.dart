import 'package:artdesign/app/core/routes/app_pages.dart';
import 'package:artdesign/app/presentation/home/home_controller.dart';
import 'package:artdesign/app/presentation/home/widgets/article.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../core/widgets/index.dart' as core_widgets;
import 'widgets/event.dart';
import 'widgets/professional.dart';
import 'widgets/projects.dart';
import 'widgets/swiper.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icons/logo-light.png', scale: 5),
        actions: [
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/icons/ic-search.png',
                width: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          InkResponse(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(
                'assets/icons/ic-notification.png',
                width: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SwiperWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Divider(
                  height: 0,
                ),
              ),
              Container(
                height: 250,
                color: Theme.of(context).colorScheme.onPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: core_widgets.Section(
                        title: 'featured projects'.tr(),
                        more: true,
                        onTap: () => Get.toNamed(Routes.projects),
                      ),
                    ),
                    const Expanded(child: ProjectWidget())
                  ],
                ),
              ),
              Container(
                  height: 180,
                  color: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: core_widgets.Section(
                        title: 'featured professional'.tr(),
                        more: true,
                        onTap: () => Get.toNamed(Routes.professional),
                      ),
                    ),
                    const Expanded(child: ProfessionalWidget())
                  ])),
              Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: core_widgets.Section(
                        title: 'events'.tr(),
                        more: false,
                        onTap: () => debugPrint('data'),
                      ),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: EventWidget(),
                    ))
                  ])),
              Container(
                color: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.only(top: 16.0, left: 12, right: 12),
                child: core_widgets.Section(
                  title: 'featured article'.tr(),
                  more: true,
                  onTap: () => debugPrint('data'),
                ),
              ),
              Container(
                  color: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 8.0),
                  child: const ArticleWidget()),
            ],
          )),
    );
  }
}
