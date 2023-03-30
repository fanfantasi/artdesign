import 'package:artdesign/app/core/routes/app_pages.dart';
import 'package:artdesign/app/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/conditional/browser_conditional.dart';
import '../../../core/config/constants.dart';
import '../../../core/config/formatter.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class ArticleWidget extends GetView<HomeController> {
  const ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.articleState.value) {
        case ViewState.busy:
          return const core_widgets.LoadingWidget();

        case ViewState.error:
          return Container(
            height: 82,
          );

        case ViewState.data:
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              height: 0,
            ),
            itemCount: controller.articles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              return InkResponse(
                onTap: () => Get.toNamed(Routes.articlebyid,
                    arguments: controller.articles[i]),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: SizedBox(
                      height: 82,
                      width: Get.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.articles[i].title!,
                                  textAlign: TextAlign.left,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_rounded,
                                      size: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(.8),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      Formatter.dateformat(
                                          controller.articles[i].createDate!),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'By ${controller.articles[i].createdBy}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8.0),
                            width: Get.width / 2.5,
                            height: 76,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(8),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: controller.articles[i].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        default:
          return const core_widgets.LoadingWidget();
      }
    });
  }
}
