import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/Buttons/primary_progress_button.dart';
import 'package:tasks/widgets/dark_background/dark_radial_background.dart';
import 'package:tasks/widgets/Navigation/app_header.dart';
import 'package:tasks/widgets/table_calendar.dart';

class TaskDueDateScreen extends StatelessWidget {
  const TaskDueDateScreen({Key? key}) : super(key: key);

  static const String routeName = '/task-due';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const TaskDueDateScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    DateTime? dateTime;

    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TaskezAppHeader(title: "Due Date", widget: SizedBox()),
                ),
                const SizedBox(height: 40),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecorationStyles.fadingGlory,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: DecoratedBox(
                        decoration: BoxDecorationStyles.fadingInnerDecor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CalendarView(
                                onPressedDay: (date) => dateTime = date,
                              ),
                              AppSpaces.verticalSpace20,
                              _buildTimerContainer()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 20),
              width: responsive.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.lato(
                          color: HexColor.fromHex("F49189"),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  PrimaryProgressButton(
                    label: "Aceptar",
                    callback: () => Navigator.pop(context, dateTime),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimerContainer() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: AppColors.primaryBackgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConditionText(
              label: "Due Time",
              color: HexColor.fromHex("BE5EF6"),
              value: "12:30 PM"),
          AppSpaces.horizontalSpace20,
          AppSpaces.horizontalSpace20,
          Container(
              width: 0.3,
              color: HexColor.fromHex("686C7D"),
              height: double.infinity),
          AppSpaces.horizontalSpace20,
          AppSpaces.horizontalSpace20,
          ConditionText(
              label: "Repeat",
              color: HexColor.fromHex("93EEEE"),
              value: "Never"),
        ],
      ),
    );
  }
}

class ConditionText extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const ConditionText({
    required this.label,
    required this.value,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: HexColor.fromHex("686C7D"),
            ),
          ),
          AppSpaces.verticalSpace10,
          Text(
            value,
            style: GoogleFonts.lato(
                color: color, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
