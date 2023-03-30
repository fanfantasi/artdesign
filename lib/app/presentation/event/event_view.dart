import 'package:artdesign/app/presentation/event/event_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../core/conditional/browser_conditional.dart';
import '../../core/config/constants.dart';
import '../../core/config/formatter.dart';
import '../../core/widgets/index.dart' as core_widgets;

class EventView extends GetView<EventController> {
  final bool page;
  const EventView({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: page ? 0 : 32,
        elevation: .6,
        leading: page
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
        title: Text('events'.tr()),
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Theme.of(context).backgroundColor,
        child: Obx(() {
          switch (controller.setState.value) {
            case ViewState.busy:
              return const core_widgets.LoadingWidget();

            case ViewState.error:
              return const core_widgets.ErrorWidget();

            case ViewState.data:
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 0,
                ),
                itemCount: controller.events.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  return InkResponse(
                      onTap: () => debugPrint('detail event'),
                      child: Container(
                        height: Get.width / 2.5,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Stack(
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    ),
                                    Text(
                                      Formatter.dateformat(
                                          controller.event[i].date!),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            default:
              return const core_widgets.LoadingWidget();
          }
        }),
      ),
    );
  }
}
