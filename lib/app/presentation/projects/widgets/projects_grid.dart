import 'package:artdesign/app/core/conditional/browser_conditional.dart';
import 'package:artdesign/app/core/routes/app_pages.dart';
import 'package:artdesign/app/data/model/projects.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectGridWidget extends StatelessWidget {
  const ProjectGridWidget({Key? key, required this.resultProject})
      : super(key: key);
  final ResultProjectsModel resultProject;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => Get.toNamed(Routes.projectdetail, arguments: resultProject),
      child: Container(
        padding: const EdgeInsets.only(bottom: 4.0),
        margin: const EdgeInsets.all(2.0),
        height: Get.width / 2,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'project-${resultProject.imageProject!.thumbnail!}',
              child: SizedBox(
                width: Get.width / 2,
                height: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(4),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: resultProject.imageProject!.thumbnail!,
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(4),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: resultProject.imageProject!.image![index],
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
                '${resultProject.title}',
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
                '${resultProject.professional}',
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
  }
}
