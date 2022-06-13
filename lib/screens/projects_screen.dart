import 'package:flutter/material.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/Chat/add_chat_icon.dart';
import 'package:tasks/widgets/dark_background/dark_radial_background.dart';
import 'package:tasks/widgets/Navigation/app_header.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TaskezAppHeader(
                      title: "Chat",
                      widget: AppAddIcon(),
                    ),
                    AppSpaces.verticalSpace20,
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
