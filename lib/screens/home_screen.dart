import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_flutter/modules/home/controllers/home_controller.dart';
import 'package:course_flutter/widgets/CarouselItem.dart';
import 'package:course_flutter/widgets/CategoryItem.dart';
import 'package:course_flutter/widgets/StoryItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home_screen extends StatelessWidget {
  final HomeController controller;
  const home_screen(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = controller.courseList
        .map(
          (item) => CarouselItem(item),
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
