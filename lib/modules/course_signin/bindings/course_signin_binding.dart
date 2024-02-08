import 'package:get/get.dart';

import '../controllers/course_signin_controller.dart';

class course_signin_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<course_signin_controller>(
      () => course_signin_controller(),
    );
  }
}
