import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/helpers/colors/HexColor.dart';
import 'package:course_flutter/routes/app_routes.dart';
import 'package:course_flutter/theme/colors/Warna.dart';
import 'package:course_flutter/theme/styles/text/poppins_style_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarouselItem extends StatelessWidget {
  final CourseInfo courseInfo;
  const CarouselItem(this.courseInfo, {super.key});

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
