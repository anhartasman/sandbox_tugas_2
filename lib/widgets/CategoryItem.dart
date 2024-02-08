import 'package:flutter/material.dart';

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
