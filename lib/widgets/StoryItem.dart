import 'package:flutter/material.dart';

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
