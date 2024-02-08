import 'package:get/get.dart';

import '../controllers/course_detail_controller.dart';

class course_detail_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<course_detail_controller>(
      () => course_detail_controller(),
    );
  }
}
