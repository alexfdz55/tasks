import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/cubits/cubit_notifier.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheets.dart';
import 'package:tasks/widgets/BottomSheets/dashboard_settings_sheet.dart';
import 'package:tasks/widgets/buttons/primary_tab_buttons.dart';
import 'package:tasks/widgets/Shapes/app_settings_icon.dart';
import 'components/tabs/overview.dart';
import 'components/tabs/productivity.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final _homeTabNotifier = CubitNotifier<int>(0);

  // final ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

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
                  BlocBuilder<CubitNotifier<int>, int>(
                    bloc: _homeTabNotifier,
                    builder: (context, state) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PrimaryTabButton(
                          buttonText: "Resumen",
                          isSelected: state == 0,
                          callback: () => _homeTabNotifier.value = 0,
                        ),
                        PrimaryTabButton(
                          buttonText: "Productividad",
                          isSelected: state == 1,
                          callback: () => _homeTabNotifier.value = 1,
                        )
                      ],
                    ),
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
                    ),
                  ),
                ],
              ),
              AppSpaces.verticalSpace20,
              BlocBuilder<CubitNotifier<int>, int>(
                bloc: _homeTabNotifier,
                builder: (context, state) =>
                    state == 0 ? const ResumenTab() : const ProductivityTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
