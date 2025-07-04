import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/buttons/primary_tab_buttons.dart';
import 'package:tasks/widgets/dark_background/dark_radial_background.dart';
import 'package:tasks/widgets/projects/layout_list_tile.dart';
import 'package:tasks/widgets/projects/project_detail_appbar.dart';
import 'package:tasks/widgets/projects/project_task_card.dart';
import 'package:tasks/widgets/shapes/app_settings_icon.dart';

// ignore: must_be_immutable
class ProjectDetailsScreen extends StatelessWidget {
  // final String color;
  // final String projectName;
  // final String category;
  ProjectDetailsScreen({
    Key? key,
    // required this.color,
    // required this.projectName,
    // required this.category,
  }) : super(key: key);

  static const String routeName = '/project-details';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ProjectDetailsScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);
  final ValueNotifier<int> _layoutButtonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectDetailAppBar(
                      category: 'category',
                      color: 'A06AFA',
                      iconTapped: (() {
                        // showSettingsBottomSheet(c);
                      }),
                      projectName: 'projectName',
                    ),
                    AppSpaces.verticalSpace20,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //tab indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PrimaryTabButton(
                                buttonText: "All Tasks",

                                // notifier: _settingsButtonTrigger
                              ),
                              PrimaryTabButton(
                                buttonText: "Recent",

                                // notifier: _settingsButtonTrigger
                              ),
                              PrimaryTabButton(
                                buttonText: "Starred",

                                // notifier: _settingsButtonTrigger
                              )
                            ],
                          ),

                          Container(
                              alignment: Alignment.centerRight,
                              child: AppSettingsIcon(
                                callback: (() {
                                  _showLayoutDialog(context);
                                }),
                              ))
                        ]),
                    AppSpaces.verticalSpace10,
                    Expanded(
                        child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView(children: [
                        AppSpaces.verticalSpace10,
                        ExpansionTile(
                            initiallyExpanded: true,
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            title: Text("IDEAS (3)",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor.fromHex("616575"),
                                )),
                            children: const [
                              ProjectTaskCard(
                                  activated: true,
                                  header: "Orientation",
                                  image: "assets/memoji/2.png",
                                  backgroundColor: "FCA4FF",
                                  date: "Today 12:00PM"),
                              ProjectTaskCard(
                                  activated: true,
                                  header: "Client Briefing",
                                  image: "assets/man-head.png",
                                  backgroundColor: "93F0F0",
                                  date: "Today 3:00PM"),
                              ProjectTaskCard(
                                  activated: false,
                                  header: "WireFraming",
                                  image: "assets/memoji/9.png",
                                  backgroundColor: "8D96FF",
                                  date: "Tomorrow 4:15PM"),
                            ]),
                        AppSpaces.verticalSpace10,
                        ExpansionTile(
                            initiallyExpanded: true,
                            collapsedIconColor: Colors.white,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            title: Text("DESIGN (12)",
                                style: GoogleFonts.lato(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor.fromHex("616575"),
                                )),
                            children: const [
                              ProjectTaskCard(
                                  activated: false,
                                  header: "Onboarding Screens",
                                  image: "assets/memoji/2.png",
                                  backgroundColor: "FCA4FF",
                                  date: "Today 12:00PM"),
                              ProjectTaskCard(
                                  activated: false,
                                  header: "Sign In - Sign Up",
                                  image: "assets/man-head.png",
                                  backgroundColor: "93F0F0",
                                  date: "Today 3:00PM"),
                              ProjectTaskCard(
                                  activated: false,
                                  header: "WireFraming",
                                  image: "assets/memoji/9.png",
                                  backgroundColor: "8D96FF",
                                  date: "Tomorrow 4:15PM"),
                            ])
                      ]),
                    ))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  _showLayoutDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          insetPadding: EdgeInsets.only(bottom: 500),
          backgroundColor: HexColor.fromHex("262A34"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          children: [
            const LayoutListTile(
              index: 0,
              icon: Icons.checklist,
              title: 'List',
            ),
            Divider(height: 1, color: HexColor.fromHex("353742")),
            const LayoutListTile(
              index: 1,
              icon: Icons.dashboard,
              title: 'Board',
            ),
          ],
          /* ... */
        );
      },
    );
  }
}
