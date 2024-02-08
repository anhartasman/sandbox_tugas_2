import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeModelBottomMenu {
  final IconData theIcon;
  const HomeModelBottomMenu(this.theIcon);
}

const List<HomeModelBottomMenu> bottomMenuList = [
  HomeModelBottomMenu(
    FontAwesomeIcons.thLarge,
  ),
  HomeModelBottomMenu(
    FontAwesomeIcons.compass,
  ),
  HomeModelBottomMenu(
    FontAwesomeIcons.envelope,
  ),
  HomeModelBottomMenu(
    FontAwesomeIcons.user,
  ),
];
