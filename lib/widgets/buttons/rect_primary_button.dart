import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';

class RectPrimaryButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final int itemIndex;
  final VoidCallback? callback;
  const RectPrimaryButtonWithIcon(
      {Key? key,
      this.callback,
      this.icon,
      required this.buttonText,
      required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // notifier.value = itemIndex;
        if (callback != null) {
          callback!();
        }
      },
      style: ButtonStyle(
          backgroundColor: true
              ? MaterialStateProperty.all<Color>(HexColor.fromHex("246CFE"))
              : MaterialStateProperty.all<Color>(HexColor.fromHex("181A1F")),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: true
                      ? BorderSide(color: HexColor.fromHex("246CFE"))
                      : BorderSide(color: HexColor.fromHex("181A1F"))))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon!, color: Colors.white),
            Text("   $buttonText",
                style: GoogleFonts.lato(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
