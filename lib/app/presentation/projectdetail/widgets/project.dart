import 'package:artdesign/app/data/model/projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key, required this.projectDetail})
      : super(key: key);
  final ResultProjectsModel projectDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReadMoreText(
              projectDetail.desc!,
              trimLines: 4,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: '  Show less',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Project Detail',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 6,
                            child: const Text(
                              'Type',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.check_box_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            projectDetail.detailProject!.type!,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 6,
                            child: const Text(
                              'Size',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.check_box_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            projectDetail.detailProject!.size!,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 6,
                            child: const Text(
                              'Design',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.check_box_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            projectDetail.detailProject!.design!,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 6,
                            child: const Text(
                              'Architect',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.check_box_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            projectDetail.detailProject!.architect!,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 6,
                            child: const Text(
                              'Location',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.check_box_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            projectDetail.detailProject!.location!,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 6,
                            child: const Text(
                              'Status',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.check_box_outlined,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            projectDetail.detailProject!.status!,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
