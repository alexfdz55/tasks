import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/values/values.dart';

class PrimaryTabButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  // final int itemIndex;
  final VoidCallback? callback;

  const PrimaryTabButton({
    Key? key,
    this.callback,
    this.isSelected = false,
    required this.buttonText,
    // required this.itemIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: callback,
        // onPressed: () {
        //   // notifier.value = itemIndex;
        //   // if (callback != null) {
        //   //   callback!();
        //   // }
        // },
        style: ButtonStyle(
          backgroundColor: isSelected //notifier.value == itemIndex
              ? MaterialStateProperty.all<Color>(HexColor.fromHex("246CFE"))
              : MaterialStateProperty.all<Color>(HexColor.fromHex("181A1F")),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: isSelected
                  ? BorderSide(color: HexColor.fromHex("246CFE"))
                  : BorderSide(color: HexColor.fromHex("181A1F")),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
