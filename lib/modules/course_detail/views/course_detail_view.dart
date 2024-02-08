import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_flutter/architectures/domain/entities/CourseAudio.dart';
import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/helpers/colors/HexColor.dart';
import 'package:course_flutter/helpers/colors/color_data.dart';
import 'package:course_flutter/modules/course_signin/views/course_signin_view.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:course_flutter/widgets/navbar/HomeNavBar.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_detail_controller.dart';

class course_detail_view extends GetView<course_detail_controller> {
  final CourseInfo courseInfo;
  const course_detail_view(
    this.courseInfo, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Course Details",
            style: PoppinsSemiBold18,
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: buttonColor,
          ),
          tooltip: 'Back',
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.heart,
              color: buttonColor,
            ),
            tooltip: 'wishlist',
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Hero(
                  tag: courseInfo.courseImage,
                  child: AspectRatio(
                    aspectRatio: 400 / 300,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.topCenter,
                          image: NetworkImage(
                            courseInfo.courseImage,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 14,
                              offset: const Offset(0, 5)),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Image.asset("assets/icon/play.png"),
                    ),
                  ),
                ),
              ),
              Text(
                "Step design sprint for beginner",
                style: PoppinsSemiBold18.copyWith(
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16,
                ),
                child: Row(
                  children: List.generate(courseInfo.tags.length, (index) {
                    final theTag = courseInfo.tags[index];
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: HexColor(theTag.color),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        theTag.name,
                        style: PoppinsMedium10.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Text(
                  courseInfo.courseDescription,
                  style: PoppinsRegular14.copyWith(
                    color: Warna.loginLabel,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: ClipOval(
                        child: Container(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            courseInfo.authorPict,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              courseInfo.authorName,
                              style: PoppinsSemiBold16.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            courseInfo.authorTitle,
                            style: PoppinsMedium10.copyWith(
                              color: Warna.loginLabel,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Image.asset("assets/icon/stopwatch.png"),
                              ),
                              Text(
                                courseInfo.courseDuration,
                                style: PoppinsMedium10.copyWith(
                                  color: Warna.greyHome,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFFCCC75),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            courseInfo.courseCategory,
                            style: PoppinsMedium10.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16,
                ),
                child: Column(
                  children: List.generate(courseInfo.playlist.length, (index) {
                    final theAudio = courseInfo.playlist[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: _audioItem(
                        theAudio,
                        isFirst: index == 0,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(16),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  MediaQueryData mediaQueryData = MediaQuery.of(context);
                  final appHeight = mediaQueryData.size.height;
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: Get.context!,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        child: course_signin_view(courseInfo),
                        height: appHeight * 0.75,
                      );
                    },
                  );
                },
                child: Text("Follow class"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEC5F5F),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
