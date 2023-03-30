import 'package:artdesign/app/core/config/constants.dart';
import 'package:artdesign/app/data/model/article.dart';
import 'package:artdesign/injector.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/usecases/article/get_local_article.dart';

class ArticleController extends GetxController {
  final setState = ViewState.initial.obs;
  final getLocalArticle = Injector.resolve<GetLocalArticle>();
  List<ResultArticleModel> article = [];
  List<ResultArticleModel> get articles => List.from(article);

  @override
  void onInit() {
    articleFetch();
    super.onInit();
  }

  Future<void> articleFetch() async {
    if (setState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalArticle.call(NoParams());
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<ResultArticleModel>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data article",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      article = data;
      _setState(ViewState.data);
    });
  }

  void _setState(ViewState state) {
    setState.value = state;
  }
}
