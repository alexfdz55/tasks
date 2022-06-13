import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/values/values.dart';

class LayoutListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;

  const LayoutListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      width: responsive.width - 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(icon, color: Colors.white, size: 30),
              AppSpaces.horizontalSpace20,
              Text(title,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 20))
            ]),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: Radio(
                // overlayColor:  unselectedWi,
                value: true,
                groupValue: index,
                onChanged: ((value) {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
