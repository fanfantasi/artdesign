import 'package:artdesign/app/data/model/event.dart';
import 'package:artdesign/injector.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/usecases/event/get_local_event.dart';

class EventController extends GetxController {
  final setState = ViewState.initial.obs;
  final getLocalEvent = Injector.resolve<GetLocalEvent>();
  List<ResultEventModel> event = [];
  List<ResultEventModel> get events => List.from(event);

  @override
  void onInit() {
    eventFetch();
    super.onInit();
  }

  Future<void> eventFetch() async {
    if (setState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalEvent.call(NoParams());
    _handleFetchResultEvent(result);
  }

  void _handleFetchResultEvent(Either<Failure, List<ResultEventModel>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
      Get.snackbar("Error", "Terjadi sebuah kesalahan pada data event",
          icon: const Icon(Icons.close_rounded, color: Colors.red),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          snackPosition: SnackPosition.TOP);
    }, (data) {
      event = data;
      _setState(ViewState.data);
    });
  }

  void _setState(ViewState state) {
    setState.value = state;
  }
}
