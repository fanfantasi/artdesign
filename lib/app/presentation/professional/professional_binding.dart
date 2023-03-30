import 'package:artdesign/app/presentation/professional/professional_controller.dart';
import 'package:get/get.dart';

class ProfessionalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfessionalController>(() => ProfessionalController());
  }
}
