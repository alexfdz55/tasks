import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:tasks/models/data_model.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/buttons/primary_tab_buttons.dart';
import 'package:tasks/widgets/navigation/app_header.dart';
import 'package:tasks/widgets/chat/add_chat_icon.dart';
import 'package:tasks/widgets/projects/project_card_horizontal.dart';
import 'package:tasks/widgets/projects/project_card_vertical.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({Key? key}) : super(key: key);

  static const String routeName = '/project';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ProjectScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  final ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);
  final ValueNotifier<bool> _switchGridLayout = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: SafeArea(
          child: TaskezAppHeader(
            title: "Projects",
            widget: AppAddIcon(scale: 1.0),
          ),
        ),
      ),
      AppSpaces.verticalSpace20,
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PrimaryTabButton(
                buttonText: "Favorites",

                // notifier: _settingsButtonTrigger
              ),
              PrimaryTabButton(
                buttonText: "Recent",

                // notifier: _settingsButtonTrigger
              ),
              PrimaryTabButton(
                buttonText: "All",

                // notifier: _settingsButtonTrigger
              )
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
                onTap: () {
                  // _showDashboardSettings(context);
                },
                child: true
                    ? const Icon(FeatherIcons.clipboard,
                        color: Colors.white, size: 30)
                    : const Icon(FeatherIcons.grid,
                        color: Colors.white, size: 30)),
          ),
        ]),
      ),
      AppSpaces.verticalSpace20,
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20.0),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //change
                crossAxisCount: 2,
                mainAxisSpacing: 10,

                //change height 125
                mainAxisExtent: 220,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (_, index) => true
                  ? ProjectCardVertical(
                      projectName: AppData.productData[index]['projectName'],
                      category: AppData.productData[index]['category'],
                      color: AppData.productData[index]['color'],
                      ratingsUpperNumber: AppData.productData[index]
                          ['ratingsUpperNumber'],
                      ratingsLowerNumber: AppData.productData[index]
                          ['ratingsLowerNumber'],
                    )
                  : ProjectCardHorizontal(
                      projectName: AppData.productData[index]['projectName'],
                      category: AppData.productData[index]['category'],
                      color: AppData.productData[index]['color'],
                      ratingsUpperNumber: AppData.productData[index]
                          ['ratingsUpperNumber'],
                      ratingsLowerNumber: AppData.productData[index]
                          ['ratingsLowerNumber'],
                    ),
              itemCount: AppData.productData.length,
            ),
          ),
        ),
      )
    ]);
  }
}
