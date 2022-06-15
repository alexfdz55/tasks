import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/screens/screens.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SheetGoToCalendarWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color cardBackgroundColor;
  final Color textAccentColor;
  const SheetGoToCalendarWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.cardBackgroundColor,
    required this.textAccentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, TaskDueDateScreen.routeName);

        // Get.to(() => TaskDueDateScreen());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularCalendarCard(color: cardBackgroundColor),
          AppSpaces.horizontalSpace10,
          CircularCardLabel(
            label: label,
            value: value,
            color: textAccentColor,
          )
        ],
      ),
    );
  }
}

class CircularCalendarCard extends StatelessWidget {
  final Color color;
  const CircularCalendarCard({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40 * 1.5,
        height: 40 * 1.5,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: const Icon(Icons.calendar_today, color: Colors.white));
  }
}

class CircularColorCard extends StatelessWidget {
  final ValueNotifier<Color> notifier;
  const CircularColorCard({
    Key? key,
    required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (BuildContext context, Color color, __) => Container(
        width: 40 * 1.5,
        height: 40 * 1.5,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: const Icon(Icons.color_lens, color: Colors.white),
      ),
    );
  }
}

class CircularCardLabel extends StatelessWidget {
  final String? label;
  final String? value;
  final Color? color;
  final ValueNotifier<DateTime?>? notifier;
  const CircularCardLabel({
    Key? key,
    this.label,
    this.color,
    this.value,
    this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpaces.verticalSpace10,
        Text(label!,
            style: GoogleFonts.lato(
                fontSize: 16, color: HexColor.fromHex("626777"))),
        // Text(
        //   value!,
        //   // notifier!.value == DateTime(1900)
        //   //     ? '_______'
        //   //     : DateFormat('dd/MM/y').format(notifier!.value),
        //   style: GoogleFonts.lato(fontSize: 16, color: color),
        // ),
        ValueListenableBuilder(
          valueListenable: notifier!,
          builder: (BuildContext context, _, __) => Text(
            // value!,
            notifier!.value == null
                ? '_______'
                : DateFormat('dd/MM/y').format(notifier!.value!),
            style: GoogleFonts.lato(fontSize: 16, color: color),
          ),
        ),
      ],
    );
  }
}
