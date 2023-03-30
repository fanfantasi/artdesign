import 'package:artdesign/app/core/conditional/conditional.dart';
import 'package:artdesign/app/data/model/professional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conditional/browser_conditional.dart';

class ProfessionalListWidget extends StatelessWidget {
  const ProfessionalListWidget({Key? key, required this.resultProfessional})
      : super(key: key);
  final ResultProfessionalModel resultProfessional;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        onTap: () => debugPrint('detail event'),
        child: Container(
          height: Get.width / 2.5,
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(12),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: resultProfessional.background!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 92,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      Container(
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
                      SizedBox(
                        height: 22,
                        child: Text(
                          resultProfessional.title!,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      Text(
                        resultProfessional.city!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
