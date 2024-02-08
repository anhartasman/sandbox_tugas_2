import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_flutter/architectures/domain/entities/ChatInbox.dart';
import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/helpers/colors/HexColor.dart';
import 'package:course_flutter/modules/home/controllers/home_controller.dart';
import 'package:course_flutter/routes/app_routes.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:course_flutter/widgets/ChatPicture.dart';
import 'package:course_flutter/widgets/InboxItem.dart';
import 'package:course_flutter/widgets/navbar/HomeNavBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class inbox_screen extends StatelessWidget {
  final HomeController controller;
  const inbox_screen(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Row(
                children: [
                  ChatPicture(
                    userPict: "assets/image/avatar_chat_1.png",
                    isOnline: true,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Messages",
                          style: PoppinsBold16,
                        ),
                        Text(
                          "2 new messages",
                          style: PoppinsRegular14.copyWith(
                            color: Warna.greyHome,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Stack(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            "assets/icon/notification.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xFFEC5F5F),
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  label: Text(
                    "Search here",
                    style: TextStyle(
                      color: Warna.loginLabel,
                      fontSize: 16,
                    ),
                  ),
                  border: InputBorder.none,
                  fillColor: Warna.loginFill,
                  filled: true,
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.chatInbox.length,
                itemBuilder: (ctx, index) {
                  return InboxItem(controller.chatInbox[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
