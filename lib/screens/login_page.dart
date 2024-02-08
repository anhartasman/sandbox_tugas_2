import 'package:course_flutter/architectures/domain/entities/UserAuth.dart';
import 'package:course_flutter/routes/app_routes.dart';
import 'package:course_flutter/services/auth_service.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _etEmail = new TextEditingController();
  TextEditingController _etPassword = new TextEditingController();
  void submitForm() {
    final userAuth = UserAuth(
      email: _etEmail.text,
      password: _etPassword.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 150,
              child: Image.asset(
                "assets/icon/app_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              cursorColor: Colors.black87,
              decoration: InputDecoration(
                label: Text(
                  "Email",
                  style: TextStyle(
                    color: Warna.loginLabel,
                    fontSize: 16,
                  ),
                ),
                border: InputBorder.none,
                fillColor: Warna.loginFill,
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              cursorColor: Colors.black87,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(
                    color: Warna.loginLabel,
                    fontSize: 16,
                  ),
                ),
                border: InputBorder.none,
                fillColor: Warna.loginFill,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.homeMenuRoute),
                child: Text("Log in"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: PoppinsMedium16.copyWith(
                  color: Warna.loginBlue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 1,
                    color: Color(0xFFC7C9D9),
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 1,
                    color: Color(0xFFC7C9D9),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icon/fb.png"),
                    SizedBox(width: 10),
                    Text("Log in with Facebook"),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Warna.loginBlue,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icon/google.png"),
                    SizedBox(width: 10),
                    Text(
                      "Log in with Google",
                      style: TextStyle(
                        color: Color(0xFF303030),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Warna.loginFill,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.authRegisterRoute),
                  child: Text("Sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
