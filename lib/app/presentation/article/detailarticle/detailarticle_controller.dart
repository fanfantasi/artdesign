import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/data/model/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailArticleController extends GetxController {
  final scrollViewController = ScrollController();
  final setState = ViewState.initial.obs;
  ResultArticleModel? articleModel;

  @override
  void onInit() async {
    if (setState.value == ViewState.busy) return;
    _setState(ViewState.busy);

    await Future.delayed(const Duration(milliseconds: 200));
    articleModel = Get.arguments;
    _setState(ViewState.data);
    super.onInit();
  }

  void _setState(ViewState state) {
    setState.value = state;
  }
}
