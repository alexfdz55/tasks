import 'package:flutter/material.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/screens/screens.dart';

String tabSpace = "\t\t\t";

final List<Widget> dashBoardScreens = [
  HomeScreen(),
  ProjectScreen(),
  Container(),
  TasksScreen()
];

List<Color> progressCardGradientList = [
  //grenn
  HexColor.fromHex("87EFB5"),
  //blue
  HexColor.fromHex("8ABFFC"),
  //pink
  HexColor.fromHex("EEB2E8"),
];
