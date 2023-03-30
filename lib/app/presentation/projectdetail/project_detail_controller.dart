import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/data/model/projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectDetailController extends GetxController {
  final scrollViewController = ScrollController();
  final setState = ViewState.initial.obs;
  ResultProjectsModel? projectsModel;
  List<String> images = [];

  final viewSection = ViewProject.detail.obs;

  @override
  void onInit() async {
    if (setState.value == ViewState.busy) return;
    _setState(ViewState.busy);

    await Future.delayed(const Duration(milliseconds: 200));
    projectsModel = Get.arguments;
    getImages();
    _setState(ViewState.data);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollViewController.dispose();
  }

  void getImages() async {
    if (projectsModel!.imageProject!.image!.isNotEmpty) {
      images.add(projectsModel!.imageProject!.thumbnail!);
      for (var item in projectsModel!.imageProject!.image!) {
        images.add(item);
      }
    } else {
      images.add(projectsModel!.imageProject!.thumbnail!);
    }
  }

  void _setState(ViewState state) {
    setState.value = state;
  }

  void setViewProject(ViewProject state) {
    viewSection.value = state;
  }
}
