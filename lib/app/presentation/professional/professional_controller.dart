import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/core/usecases/usecase.dart';
import 'package:artdesign/app/data/model/professional.dart';
import 'package:artdesign/app/domain/usecases/professional/get_local_featured_professional.dart';
import 'package:artdesign/injector.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/errors/failure.dart';

class ProfessionalController extends GetxController {
  final scrollController = ScrollController();

  final setState = ViewState.initial.obs;
  final getLocalFeaturedProfessional =
      Injector.resolve<GetLocalFeaturedProfessional>();
  RxBool gridOrList = true.obs;
  final viewSection = ViewSection.gridorlist.obs;
  RxBool sortUp = false.obs;
  RxList<ResultProfessionalModel> professional =
      <ResultProfessionalModel>[].obs;
  List<ResultProfessionalModel> get professionals => List.from(professional);

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 500));
    professionalFetch();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  //Featured Projects
  Future<void> professionalFetch() async {
    if (setState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalFeaturedProfessional.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(
      Either<Failure, List<ResultProfessionalModel>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data professional",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      professional.value = data;
      _setState(ViewState.data);
    });
  }

  Future<void> sortItems() async {
    _setState(ViewState.busy);
    if (sortUp.value) {
      professional.sort(
        (a, b) => b.title!.toLowerCase().compareTo(a.title!.toLowerCase()),
      );
    } else {
      professional.sort(
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
