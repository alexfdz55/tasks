import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';

import 'dummy/profile_dummy.dart';

class InactiveEmployeeCard extends StatelessWidget {
  final String employeeName;
  final String employeeImage;

  final String employeePosition;
  final Color color;

  const InactiveEmployeeCard({
    Key? key,
    required this.employeeName,
    required this.color,
    required this.employeeImage,
    required this.employeePosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // notifier.value = !notifier.value;
      },
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: AppColors.primaryBackgroundColor,
            // border: Border.all(color: AppColors.primaryBackgroundColor, width: 4),
            borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          ProfileDummy(
            dummyType: ProfileDummyType.Image,
            scale: 0.85,
            color: color,
            image: employeeImage,
          ),
          AppSpaces.horizontalSpace20,
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employeeName,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.4)),
                Text(employeePosition,
                    style: GoogleFonts.lato(color: HexColor.fromHex("5A5E6D")))
              ])
        ]),
      ),
    );
  }
}
