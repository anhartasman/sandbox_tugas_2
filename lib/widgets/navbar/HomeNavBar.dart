import 'package:course_flutter/helpers/colors/color_data.dart';
import 'package:course_flutter/modules/home/controllers/home_controller.dart';
import 'package:course_flutter/screens/models/home_model_bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeNavBar extends StatelessWidget {
  final HomeController controller;
  const HomeNavBar(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: shadowColor, blurRadius: 20, offset: const Offset(0, -2)),
        ],
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(bottomMenuList.length, (index) {
              final modelItem = bottomMenuList[index];
              final selected = controller.menuActive == index;
              return GestureDetector(
                onTap: () => controller.menuActive.value = index,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Stack(
                            children: [
                              Center(
                                child: FaIcon(
                                  modelItem.theIcon,
                                  color: selected ? buttonColor : Colors.grey,
                                ),
                              ),
                              if (index == 2)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color:
                                          selected ? buttonColor : Colors.grey,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "3",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 3,
                        color: selected ? buttonColor : Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            }),
          )), // child:
    );
  }
}
