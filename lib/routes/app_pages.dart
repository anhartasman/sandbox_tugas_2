import 'package:course_flutter/middlewares/member_guard.dart';
import 'package:course_flutter/modules/course_detail/bindings/course_detail_binding.dart';
import 'package:course_flutter/modules/course_detail/views/course_detail_view.dart';
import 'package:course_flutter/modules/home/bindings/home_binding.dart';
import 'package:course_flutter/modules/home/views/home_view.dart';
import 'package:course_flutter/screens/login_page.dart';
import 'package:course_flutter/screens/register_page.dart';
import 'package:course_flutter/screens/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:course_flutter/injection_container.dart' as di;
import 'package:course_flutter/routes/app_routes.dart';

final appPages = [
  GetPage(
    name: Routes.homeRoute,
    page: () => splash_screen(),
  ),
  GetPage(
    name: Routes.homeMenuRoute,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.courseDetailRoute,
    page: () => course_detail_view(Get.arguments),
    binding: course_detail_binding(),
  ),
  GetPage(
    name: Routes.authLoginRoute,
    page: () => login_page(),
  ),
  GetPage(
    name: Routes.authRegisterRoute,
    page: () => register_page(),
  ),
];
