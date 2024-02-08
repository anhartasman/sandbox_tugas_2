import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_flutter/architectures/domain/entities/CourseAudio.dart';
import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/helpers/colors/HexColor.dart';
import 'package:course_flutter/helpers/colors/color_data.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:course_flutter/widgets/navbar/HomeNavBar.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_signin_controller.dart';

class course_signin_view extends StatelessWidget {
  final CourseInfo courseInfo;
  const course_signin_view(
    this.courseInfo, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    course_signin_controller controller = Get.put(
      course_signin_controller(),
      tag: courseInfo.courseImage,
    ); // Controller dependency injected

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 12, bottom: 16),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available time",
                          style: PoppinsSemiBold18,
                        ),
                        Text(
                          "Adjust to your schedule",
                          style: PoppinsRegular16.copyWith(
                            color: Warna.greyHome,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Warna.loginLabel,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 4)),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.calendarAlt,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _ScheduleChoices(),
            ),
            Text(
              "Email",
              style: PoppinsSemiBold14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: controller.userEmail,
                keyboardType: TextInputType.emailAddress,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8.0),
              child: Text(
                "Telp number",
                style: PoppinsSemiBold14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  label: Text(
                    "Telp number",
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "Schedule date & time",
                style: PoppinsSemiBold14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.checkedSchedule.value,
                        onChanged: (value) => controller.toggleSchedule(),
                        activeColor: buttonColor.withOpacity(0.3),
                        focusColor: buttonColor.withOpacity(0.3),
                        checkColor: Colors.red,
                      ),
                      Text(
                        "12 October, 2020 at 09.45 AM",
                        style: PoppinsRegular16.copyWith(
                          color: Warna.loginLabel,
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Log In"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleChoices extends StatelessWidget {
  const _ScheduleChoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("All"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEC5F5F),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("All"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("All"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEC5F5F),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("All"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("All"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEC5F5F),
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("All"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("All"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEC5F5F),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("All"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("All"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEC5F5F),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _audioItem extends StatelessWidget {
  final CourseAudio theAudio;
  final bool isFirst;
  const _audioItem(
    this.theAudio, {
    super.key,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Warna.loginFill,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: isFirst
                        ? DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: AssetImage(
                              "assets/image/play_red_bg.png",
                            ),
                          )
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                  ),
                ),
                isFirst
                    ? Image.asset(
                        "assets/icon/play.png",
                        width: 40,
                      )
                    : FaIcon(
                        FontAwesomeIcons.play,
                        color: Colors.red,
                      ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  theAudio.title,
                  style: PoppinsSemiBold14,
                ),
                Text(
                  theAudio.duration,
                  style: PoppinsRegular14.copyWith(
                    color: Warna.greyHome,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
