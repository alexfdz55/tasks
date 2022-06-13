import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';

// ignore: must_be_immutable
class ToggleLabelOption extends StatelessWidget {
  final String label;

  final IconData icon;
  final double? margin;

  const ToggleLabelOption(
      {Key? key, required this.label, required this.icon, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: margin ?? 8.0), // 8.0 as default margin.
          child: MergeSemantics(
              child: ListTile(
                  title: Row(
                    children: [
                      Icon(icon, color: Colors.white, size: 24),
                      Text(label,
                          style: GoogleFonts.lato(
                              fontSize: 18, color: Colors.white)),
                    ],
                  ),
                  trailing: false
                      ? const SizedBox()
                      : CupertinoSwitch(
                          value: true,
                          activeColor: AppColors.primaryAccentColor,
                          onChanged: (bool value) {},
                        ))),
        ),
        Divider(height: 1, color: HexColor.fromHex("353742"))
        // Divider(height: 1, color: HexColor.fromHex("616575"))
      ],
    );
  }
}
