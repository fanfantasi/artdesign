import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/core/errors/failure.dart';
import 'package:artdesign/app/core/usecases/usecase.dart';
import 'package:artdesign/app/data/model/projects.dart';
import 'package:artdesign/injector.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/projects/get_local_fetured_project.dart';

class ProjectsController extends GetxController {
  final scrollController = ScrollController();

  final setState = ViewState.initial.obs;
  final getLocalFeaturedProjects = Injector.resolve<GetLocalFeaturedProjects>();
  RxBool gridOrList = true.obs;
  final viewSection = ViewSection.gridorlist.obs;
  RxBool sortUp = false.obs;
  RxList<ResultProjectsModel> project = <ResultProjectsModel>[].obs;
  List<ResultProjectsModel> get projects => List.from(project);

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 500));
    projectsFetch();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  //Featured Projects
  Future<void> projectsFetch() async {
    if (setState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalFeaturedProjects.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<ResultProjectsModel>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data projects",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      project.value = data;
      _setState(ViewState.data);
    });
  }

  Future<void> sortItems() async {
    _setState(ViewState.busy);
    if (sortUp.value) {
      project.sort(
        (a, b) => b.title!.toLowerCase().compareTo(a.title!.toLowerCase()),
      );
    } else {
      project.sort(
        (a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()),
      );
    }
    _setState(ViewState.data);
  }

  void _setState(ViewState state) {
    setState.value = state;
  }

  void setViewSection(ViewSection state) {
    viewSection.value = state;
  }
}
