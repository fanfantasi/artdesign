import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text('page not found').tr(),
        ),
        body: SizedBox(
          height: Get.height,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Icon(
                  Icons.now_widgets_outlined,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(.1),
                  size: 320,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.gps_not_fixed_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'page not found',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'page not found desc',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ).tr(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
