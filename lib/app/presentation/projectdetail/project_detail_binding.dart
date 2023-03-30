import 'package:artdesign/app/presentation/projectdetail/project_detail_controller.dart';
import 'package:get/get.dart';

class ProjectDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDetailController>(
      () => ProjectDetailController(),
    );
  }
}
