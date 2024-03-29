import 'package:artdesign/app/presentation/projects/projects_controller.dart';
import 'package:get/get.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(),
    );
  }
}
