import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/dummy/profile_dummy.dart';
import 'package:tasks/widgets/text_outlined_button.dart';

import 'back_button.dart';

class DefaultNav extends StatelessWidget {
  final String title;
  final ProfileDummyType? type;
  const DefaultNav({Key? key, this.type, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppBackButton(),
      Text(this.title,
          style: GoogleFonts.lato(fontSize: 20, color: Colors.white)),
      Builder(builder: (context) {
        if (type == ProfileDummyType.Icon) {
          return ProfileDummy(
              color: HexColor.fromHex("93F0F0"),
              dummyType: ProfileDummyType.Image,
              image: "assets/man-head.png",
              scale: 1.2);
        } else if (type == ProfileDummyType.Image) {
          return ProfileDummy(
              color: HexColor.fromHex("9F69F9"),
              dummyType: ProfileDummyType.Icon,
              scale: 1.0);
        } else if (type == ProfileDummyType.Button) {
          return OutlinedButtonWithText(
            width: 75,
            content: "Edit",
            onPressed: () {},
          );
        } else {
          return Container();
        }
      }),
    ]);
  }
}
