import 'package:course_flutter/routes/app_routes.dart';
import 'package:course_flutter/services/auth_service.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // final authService = Get.find<AuthService>();
    // authService.checkIsLoggedIn().then((value) =>
    //     Future.delayed(Duration(seconds: 2))
    //         .then((value) => Get.offNamed(Routes.homeMenuRoute)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/logo/logo_app.png",
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Welcome to Ajheryuk",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Best and popular apps for live education course from home",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8C8C8C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Container(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.authLoginRoute),
                    child: Text("Get started"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEC5F5F),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
