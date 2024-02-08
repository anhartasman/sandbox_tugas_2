import 'package:flutter/material.dart';

class ChatPicture extends StatelessWidget {
  final String userPict;
  final bool isOnline;
  const ChatPicture({
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
