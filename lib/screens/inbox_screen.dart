import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_flutter/architectures/domain/entities/ChatInbox.dart';
import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/helpers/colors/HexColor.dart';
import 'package:course_flutter/modules/home/controllers/home_controller.dart';
import 'package:course_flutter/routes/app_routes.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
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
                  _chatPicture(
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
                  return _InboxItem(controller.chatInbox[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InboxItem extends StatelessWidget {
  final ChatInbox chatInbox;
  const _InboxItem(this.chatInbox, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: _chatPicture(
                userPict: chatInbox.userPict,
                isOnline: chatInbox.isOnline,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 0.8,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chatInbox.userName,
                            style: PoppinsSemiBold16,
                          ),
                          Text(
                            chatInbox.chatText,
                            style: PoppinsRegular14.copyWith(
                              color: Warna.greyHome,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            toTanggal(chatInbox.chatDate, "dd/MM/yy"),
                            style: PoppinsRegular14.copyWith(
                              color: Warna.greyHome,
                            ),
                          ),
                        ),
                        if (chatInbox.chatUnread > 0)
                          Container(
                            width: 30.0,
                            height: 30.0,
                            child: Center(
                                child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            decoration: BoxDecoration(
                              color: Warna.biru,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  String toTanggal(DateTime theDate, String formatTujuan) {
    final outputFormat = DateFormat(formatTujuan);
    final outputDate = outputFormat.format(theDate);
    return outputDate;
  }
}

class _chatPicture extends StatelessWidget {
  final String userPict;
  final bool isOnline;
  const _chatPicture({
    super.key,
    required this.userPict,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      child: Stack(
        children: [
          Image.asset(
            width: 45,
            height: 45,
            userPict,
            fit: BoxFit.cover,
          ),
          if (isOnline)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF4ED442),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
