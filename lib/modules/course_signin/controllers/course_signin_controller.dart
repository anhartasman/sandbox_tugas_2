import 'package:flutter/material.dart';
import 'package:get/get.dart';

class course_signin_controller extends GetxController {
  var checkedSchedule = false.obs;
  TextEditingController userEmail = new TextEditingController();
  void toggleSchedule() {
    checkedSchedule.value = !checkedSchedule.value;
  }
}
