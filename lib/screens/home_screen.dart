import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheets.dart';
import 'package:tasks/widgets/BottomSheets/dashboard_settings_sheet.dart';
import 'package:tasks/widgets/Buttons/primary_tab_buttons.dart';
import 'package:tasks/widgets/Shapes/app_settings_icon.dart';
import '../widgets/home/tabs/overview.dart';
import '../widgets/home/tabs/productivity.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DashboardNav(
              //   icon: FontAwesomeIcons.comment,
              //   image: "assets/man-head.png",
              //   notificationCount: "2",
              //   page: Container(),
              //   title: "Dashboard",
              //   onImageTapped: () {},
              // ),
              AppSpaces.verticalSpace20,
              Text(
                "Tasks 🌟",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpaces.verticalSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PrimaryTabButton(
                        buttonText: "Overview",
                        itemIndex: 0,
                        notifier: _buttonTrigger,
                      ),
                      PrimaryTabButton(
                        buttonText: "Productivity",
                        itemIndex: 1,
                        notifier: _buttonTrigger,
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: AppSettingsIcon(
                        callback: () {
                          // ignore: void_checks
                          return showAppBottomSheet(
                            context,
                            const DashboardSettingsBottomSheet(),
                          );
                        },
                      ))
                ],
              ),
              AppSpaces.verticalSpace20,
              ValueListenableBuilder(
                valueListenable: _buttonTrigger,
                builder: (BuildContext context, _, __) {
                  return _buttonTrigger.value == 0
                      ? const ResumenTab()
                      : const ProductivityTab();
                },
              ),
              // false ? const ResumenTab() : const ProductivityTab(),
            ],
          ),
        ),
      ),
    );
  }
}
