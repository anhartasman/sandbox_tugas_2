import 'package:course_flutter/screens/home_screen.dart';
import 'package:course_flutter/screens/inbox_screen.dart';
import 'package:course_flutter/widgets/navbar/HomeNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.menuActive.value == 0) {
          return home_screen(controller);
        }
        if (controller.menuActive.value == 2) {
          return inbox_screen(controller);
        }
        return Container();
      }),
      bottomNavigationBar: HomeNavBar(controller),
    );
  }
}
