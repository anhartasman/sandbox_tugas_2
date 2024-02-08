import 'package:carousel_slider/carousel_controller.dart';
import 'package:course_flutter/architectures/domain/entities/ChatInbox.dart';
import 'package:course_flutter/architectures/domain/entities/CourseAudio.dart';
import 'package:course_flutter/architectures/domain/entities/CourseInfo.dart';
import 'package:course_flutter/architectures/domain/entities/CourseTag.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var current = 0.obs;
  var menuActive = 0.obs;
  CarouselController carouselController = CarouselController();
  List<ChatInbox> chatInbox = [
    ChatInbox(
      userPict: "assets/image/avatar_chat_2.png",
      userName: "Roger Hulg",
      chatText: "Hey, can i ask something? i need your help please",
      chatUnread: 4,
      isOnline: true,
      chatDate: DateTime.now().subtract(Duration(hours: 1)),
    ),
    ChatInbox(
      userPict: "assets/image/avatar_chat_3.png",
      userName: "Hilman Nuris",
      chatText: "thank’s for your information dude!",
      chatUnread: 0,
      isOnline: false,
      chatDate: DateTime.now().subtract(Duration(hours: 1)),
    ),
    ChatInbox(
      userPict: "assets/image/avatar_chat_4.png",
      userName: "Erick Lawrence",
      chatText: "Did you take the free illustration class yesterday?",
      chatUnread: 3,
      isOnline: true,
      chatDate: DateTime.now().subtract(Duration(hours: 1)),
    ),
  ];

  var courseData = const CourseInfo(
      authorPict: "assets/image/avatar2.png",
      authorName: 'Laurel Seilha',
      authorTitle: "Product Designer",
      courseName: 'Step design sprint for beginner',
      courseImage: 'https://picsum.photos/seed/foto1/300/500',
      courseDescription:
          "In this course I'll show the step by step, day by day process to build better products, just as Google, Slack, KLM and manu other do.",
      courseDuration: "5h 21m",
      courseCategory: "Free e-book",
      tags: [
        CourseTag(name: "6 Lessons", color: "4DC9D1"),
        CourseTag(name: "Design", color: "0082CD"),
        CourseTag(name: "Free", color: "8D5EF2"),
      ],
      playlist: [
        CourseAudio(
          title: "How to get feedback on their products in just 5 days",
          duration: "04:10m",
        ),
        CourseAudio(
          title: "How to decide which prototype to implement",
          duration: "04:10m",
        ),
      ]);
  List<CourseInfo> get courseList {
    return [
      courseData,
      courseData.copyWith(
        courseImage: 'https://picsum.photos/seed/foto2/300/500',
      ),
      courseData.copyWith(
        courseImage: 'https://picsum.photos/seed/foto3/300/500',
      ),
      courseData.copyWith(
        courseImage: 'https://picsum.photos/seed/foto4/300/500',
      ),
      courseData.copyWith(
        courseImage: 'https://picsum.photos/seed/foto5/300/500',
      ),
    ];
  }
}
