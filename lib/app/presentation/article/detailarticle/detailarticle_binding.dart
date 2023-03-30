import 'package:get/get.dart';

import 'detailarticle_controller.dart';

class DetailArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailArticleController>(
      () => DetailArticleController(),
    );
  }
}
