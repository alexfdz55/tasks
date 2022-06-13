import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:tasks/models/data_model.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/Buttons/primary_tab_buttons.dart';
import 'package:tasks/widgets/Chat/add_chat_icon.dart';
import 'package:tasks/widgets/Navigation/app_header.dart';
import 'package:tasks/widgets/Projects/project_card_horizontal.dart';
import 'package:tasks/widgets/Projects/project_card_vertical.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);
  ValueNotifier<bool> _switchGridLayout = ValueNotifier(false);

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
                  itemIndex: 0,
                  notifier: _settingsButtonTrigger),
              PrimaryTabButton(
                  buttonText: "Recent",
                  itemIndex: 1,
                  notifier: _settingsButtonTrigger),
              PrimaryTabButton(
                  buttonText: "All",
                  itemIndex: 2,
                  notifier: _settingsButtonTrigger)
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
