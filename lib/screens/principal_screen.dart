import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasks/values/constants.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheets.dart';
import 'package:tasks/widgets/dark_background/dark_radial_background.dart';
import 'package:tasks/widgets/home/bottomNavigationItem.dart';
import 'package:tasks/widgets/home/dashboard_add_icon.dart';
import 'package:tasks/widgets/home/dashboard_add_sheet.dart';

class PrincipalScreen extends StatelessWidget {
  PrincipalScreen({Key? key}) : super(key: key);

  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => PrincipalScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#181a1f"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(children: [
        DarkRadialBackground(
          color: HexColor.fromHex("#181a1f"),
          position: "topLeft",
        ),
        ValueListenableBuilder(
          valueListenable: bottomNavigatorTrigger,
          builder: (BuildContext context, _, __) {
            return PageStorage(
              bucket: PageStorageBucket(),
              child: dashBoardScreens[bottomNavigatorTrigger.value],
            );
          },
        ),
      ]),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: HexColor.fromHex("#181a1f").withOpacity(0.8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationItem(
                itemIndex: 0,
                notifier: bottomNavigatorTrigger,
                icon: Icons.widgets),
            const Spacer(),
            BottomNavigationItem(
                itemIndex: 1,
                notifier: bottomNavigatorTrigger,
                icon: FeatherIcons.clipboard),
            const Spacer(),
            DashboardAddButton(
              iconTapped: (() {
                showAppBottomSheet(
                  context,
                  const DashboardAddBottomSheet(),
                  height: Responsive(context).hp(35),
                );
              }),
            ),
            const Spacer(),
            BottomNavigationItem(
              itemIndex: 2,
              notifier: bottomNavigatorTrigger,
              icon: FeatherIcons.bell,
            ),
            const Spacer(),
            BottomNavigationItem(
              itemIndex: 3,
              notifier: bottomNavigatorTrigger,
              icon: FontAwesomeIcons.tasks,
            )
          ],
        ),
      ),
    );
  }
}
