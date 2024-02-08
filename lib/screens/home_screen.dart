import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/helpers/colors/HexColor.dart';
import 'package:course_flutter/modules/home/controllers/home_controller.dart';
import 'package:course_flutter/routes/app_routes.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:course_flutter/widgets/navbar/HomeNavBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class home_screen extends StatelessWidget {
  final HomeController controller;
  const home_screen(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = controller.courseList
        .map(
          (item) => _CarouselItem(item),
        )
        .toList();

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: 75,
          width: Get.width,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      child: Image.asset(
                        "assets/image/avatar.png",
                        fit: BoxFit.cover,
                      ),
                    ),
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
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo, Samuel!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/icon/award.png"),
                        SizedBox(width: 5),
                        Text(
                          "+1600",
                          style: TextStyle(
                            color: Color(0xFFFCD034),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " Points",
                          style: TextStyle(
                            color: Color(0xFFFCD034),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 35,
                height: 35,
                child: Stack(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      child: Image.asset(
                        "assets/icon/notification.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 15,
                        height: 15,
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
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 25),
              StoryItem(story: "assets/image/avatar_live_1.png"),
              StoryItem(story: "assets/image/avatar_live_2.png"),
              StoryItem(story: "assets/image/avatar_live_3.png"),
              StoryItem(story: "assets/image/avatar_live_4.png"),
              StoryItem(story: "assets/image/avatar_live_1.png"),
              StoryItem(story: "assets/image/avatar_live_2.png"),
              StoryItem(story: "assets/image/avatar_live_3.png"),
              StoryItem(story: "assets/image/avatar_live_4.png"),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Text(
                "Upcoming ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "course of this week",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 25),
              CategoryItem(
                title: "All",
                status: true,
              ),
              CategoryItem(
                title: "UI/UX",
                status: false,
              ),
              CategoryItem(
                title: "Illustration",
                status: false,
              ),
              CategoryItem(
                title: "3D Animation",
                status: false,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 16),
          width: 350,
          height: 600,
          transform: Matrix4.translationValues(-350 / 8, 0, 0),
          child: Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 299 / 340,
                  viewportFraction: .7,
                  onPageChanged: (index, reason) {
                    controller.current.value = index;
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.courseList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        controller.carouselController.animateToPage(entry.key),
                    child: Obx(
                      () => Container(
                        width: 20,
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: controller.current.value == entry.key
                              ? Color(0xFFEC5F5F)
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CarouselItem extends StatelessWidget {
  final CourseInfo courseInfo;
  const _CarouselItem(this.courseInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.courseDetailRoute,
        arguments: courseInfo,
      ),
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: courseInfo.courseImage,
                  child: Image.network(
                    courseInfo.courseImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            courseInfo.courseName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
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
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24.0,
                            bottom: 16,
                          ),
                          child: Row(
                            children:
                                List.generate(courseInfo.tags.length, (index) {
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      courseInfo.authorName,
                                      style: PoppinsSemiBold16.copyWith(
                                        color: Colors.white,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
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
            )),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({
    Key? key,
    required this.title,
    required this.status,
  }) : super(key: key);

  final String title;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: status == true ? Color(0xFFEC5F5F) : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: status == true ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  StoryItem({
    Key? key,
    required this.story,
  }) : super(key: key);

  final String story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 105,
      height: 105,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFFEC5F5F),
                width: 5,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(5),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    story,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFF4DC9D1),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: Image.asset("assets/icon/live_circle.png"),
            ),
          ),
        ],
      ),
    );
  }
}
