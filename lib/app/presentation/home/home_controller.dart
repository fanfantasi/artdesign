import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/core/errors/failure.dart';
import 'package:artdesign/app/core/usecases/usecase.dart';
import 'package:artdesign/app/data/model/article.dart';
import 'package:artdesign/app/data/model/banner.dart';
import 'package:artdesign/app/data/model/event.dart';
import 'package:artdesign/app/data/model/professional.dart';
import 'package:artdesign/app/data/model/projects.dart';
import 'package:artdesign/app/domain/usecases/article/get_local_article.dart';
import 'package:artdesign/app/domain/usecases/event/get_local_event.dart';
import 'package:artdesign/app/domain/usecases/professional/get_local_featured_professional.dart';
import 'package:artdesign/app/domain/usecases/projects/get_local_fetured_project.dart';
import 'package:artdesign/app/domain/usecases/sliders/get_sliders.dart';
import 'package:artdesign/injector.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  final bannerState = ViewState.initial.obs;
  final getRemoteSliders = Injector.resolve<GetRemoteSliders>();
  List<ResultSlidersModel> slider = [];
  List<ResultSlidersModel> get sliders => List.from(slider);

  final projectState = ViewState.initial.obs;
  final getLocalFeaturedProjects = Injector.resolve<GetLocalFeaturedProjects>();
  List<ResultProjectsModel> project = [];
  List<ResultProjectsModel> get projects => List.from(project);

  final professionalState = ViewState.initial.obs;
  final getLocalFeaturedProfessional =
      Injector.resolve<GetLocalFeaturedProfessional>();
  List<ResultProfessionalModel> professional = [];
  List<ResultProfessionalModel> get professionals => List.from(professional);

  final eventState = ViewState.initial.obs;
  final getLocalEvent = Injector.resolve<GetLocalEvent>();
  List<ResultEventModel> event = [];
  List<ResultEventModel> get events => List.from(event);

  final articleState = ViewState.initial.obs;
  final getLocalArticle = Injector.resolve<GetLocalArticle>();
  List<ResultArticleModel> article = [];
  List<ResultArticleModel> get articles => List.from(article);

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 500));
    slidersFetch();
    projectsFetch();
    professionalFetch();
    eventFetch();
    articleFetch();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // feth data from local database
  Future<void> slidersFetch() async {
    if (bannerState.value == ViewState.busy) return;
    _setBannerState(ViewState.busy);
    final result = await getRemoteSliders.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<ResultSlidersModel>> result) {
    result.fold((feilure) {
      _setBannerState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data banner",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      slider = data;
      _setBannerState(ViewState.data);
    });
  }

  void _setBannerState(ViewState state) {
    bannerState.value = state;
  }

  //Featured Projects
  Future<void> projectsFetch() async {
    if (projectState.value == ViewState.busy) return;
    _setProjectState(ViewState.busy);
    final result = await getLocalFeaturedProjects.call(NoParams());
    _handleFetchResultProjects(result);
  }

  void _handleFetchResultProjects(
      Either<Failure, List<ResultProjectsModel>> result) {
    result.fold((feilure) {
      _setProjectState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data projects",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      project = data;
      _setProjectState(ViewState.data);
    });
  }

  void _setProjectState(ViewState state) {
    projectState.value = state;
  }

  //Featured Professional
  Future<void> professionalFetch() async {
    if (professionalState.value == ViewState.busy) return;
    _setProfessionalState(ViewState.busy);
    final result = await getLocalFeaturedProfessional.call(NoParams());
    _handleFetchResultProfessional(result);
  }

  void _handleFetchResultProfessional(
      Either<Failure, List<ResultProfessionalModel>> result) {
    result.fold((feilure) {
      _setProfessionalState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data Professional",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      professional = data;
      _setProfessionalState(ViewState.data);
    });
  }

  void _setProfessionalState(ViewState state) {
    professionalState.value = state;
  }

  //Featured Event
  Future<void> eventFetch() async {
    if (eventState.value == ViewState.busy) return;
    _setEventState(ViewState.busy);
    final result = await getLocalEvent.call(NoParams());
    _handleFetchResultEvent(result);
  }

  void _handleFetchResultEvent(Either<Failure, List<ResultEventModel>> result) {
    result.fold((feilure) {
      _setEventState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data event",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      event = data;
      _setEventState(ViewState.data);
    });
  }

  void _setEventState(ViewState state) {
    eventState.value = state;
  }

  //Featured Article
  Future<void> articleFetch() async {
    if (articleState.value == ViewState.busy) return;
    _setArticleState(ViewState.busy);
    final result = await getLocalArticle.call(NoParams());
    _handleFetchResultArticle(result);
  }

  void _handleFetchResultArticle(
      Either<Failure, List<ResultArticleModel>> result) {
    result.fold((feilure) {
      _setArticleState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data article",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      article = data;
      _setArticleState(ViewState.data);
    });
  }

  void _setArticleState(ViewState state) {
    articleState.value = state;
  }
}
