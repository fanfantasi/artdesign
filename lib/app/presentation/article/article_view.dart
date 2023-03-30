import 'package:artdesign/app/presentation/article/article_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../core/conditional/browser_conditional.dart';
import '../../core/config/constants.dart';
import '../../core/config/formatter.dart';
import '../../core/routes/app_pages.dart';
import '../../core/widgets/index.dart' as core_widgets;

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 32,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text('article'.tr()),
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
                                          Formatter.dateformat(controller
                                              .articles[i].createDate!),
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
        }),
      ),
    );
  }
}
