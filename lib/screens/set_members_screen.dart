import 'package:flutter/material.dart';
import 'package:tasks/models/data_model.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/Buttons/primary_buttons.dart';
import 'package:tasks/widgets/dark_background/dark_radial_background.dart';
import 'package:tasks/widgets/Forms/search_box.dart';
import 'package:tasks/widgets/Navigation/app_header.dart';
import 'package:tasks/widgets/employee_card.dart';

class SelectMembersScreen extends StatelessWidget {
  SelectMembersScreen({Key? key}) : super(key: key);

  static const String routeName = '/set-members';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SelectMembersScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic data = AppData.employeeData;
    List<Widget> cards = List.generate(
        AppData.employeeData.length,
        (index) => EmployeeCard(
              activated: data[index]['activated'],
              employeeImage: data[index]['employeeImage'],
              employeeName: data[index]['employeeName'],
              backgroundColor: data[index]["color"],
              employeePosition: data[index]["employeePosition"],
            ));
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: TaskezAppHeader(
                title: "Set Assignees",
                widget: AppPrimaryButton(
                  buttonHeight: 40,
                  buttonWidth: 70,
                  buttonText: "Next",
                ),
              ),
            ),
            AppSpaces.verticalSpace40,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SearchBox(
                                        placeholder: 'Search',
                                        controller: _searchController,
                                      ),
                                      AppSpaces.verticalSpace20,
                                      Expanded(
                                          child: MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: ListView(children: [...cards]),
                                      ))
                                    ])))))),
            //AppSpaces.verticalSpace20,
            AppPrimaryButton(
                buttonHeight: 50,
                buttonWidth: 150,
                buttonText: "Add Member",
                callback: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                }),
            AppSpaces.verticalSpace20,
          ]))
    ]));
  }
}
