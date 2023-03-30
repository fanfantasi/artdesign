import 'package:artdesign/app/data/model/professional.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conditional/browser_conditional.dart';
import '../../../core/conditional/conditional.dart';

class ProfessionalGridWidget extends StatelessWidget {
  const ProfessionalGridWidget({Key? key, required this.resultProfessional})
      : super(key: key);
  final ResultProfessionalModel resultProfessional;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Container(
        padding: const EdgeInsets.only(bottom: 4.0),
        margin: const EdgeInsets.all(2.0),
        height: Get.width / 3.8,
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
          children: [
            Expanded(
                child: Stack(
              children: [
                SizedBox(
                  height: 68,
                  width: Get.width / 2.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(4),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: resultProfessional.background!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Conditional()
                              .getProvider(resultProfessional.logo!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
            SizedBox(
              width: Get.width / 2.2,
              child: AutoSizeText(
                '${resultProfessional.title}',
                maxFontSize: 14,
                minFontSize: 14,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: Get.width / 2.2,
              child: AutoSizeText(
                '${resultProfessional.city}',
                maxFontSize: 14,
                minFontSize: 10,
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
