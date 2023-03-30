import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/core/config/formatter.dart';
import 'package:artdesign/app/core/widgets/images_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'detailarticle_controller.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class DetailArticleWidget extends GetView<DetailArticleController> {
  const DetailArticleWidget({Key? key}) : super(key: key);

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
                          title: controller.articleModel!.title!,
                          subtitle: '',
                          type: ViewType.articles,
                          image: controller.articleModel!.image!,
                          logo: '',
                          tagHero:
                              'article-${controller.articleModel!.image!}'),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 12.0),
                        child: Row(
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
                                  controller.articleModel!.createDate!),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'By ${controller.articleModel!.createdBy}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Html(
                          data: controller.articleModel!.content,
                          style: {"p": Style(fontSize: FontSize.medium)},
                          onImageTap: (src, _, __, ___) {
                            Get.to(
                                ImagesView(
                                    images: [src!],
                                    title: controller.articleModel!.title!),
                                arguments: src);
                          },
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
