import 'package:flutter/material.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/Buttons/primary_buttons.dart';
import 'package:tasks/widgets/Buttons/text_button.dart';
import 'package:tasks/widgets/toggle_option.dart';
import 'bottom_sheet_holder.dart';

class DashboardSettingsBottomSheet extends StatelessWidget {
  const DashboardSettingsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace20,
      ToggleLabelOption(
          label: '    Total Task', icon: Icons.check_circle_outline),
      ToggleLabelOption(
          label: '    Task Due Soon', icon: Icons.batch_prediction),
      ToggleLabelOption(label: '    Completed', icon: Icons.check_circle),
      ToggleLabelOption(label: '    Working On', icon: Icons.flag),
      Spacer(),
      Padding(
        padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppTextButton(
            buttonText: 'Clear All',
            buttonSize: 16,
          ),
          AppPrimaryButton(
            buttonHeight: 60,
            buttonWidth: 160,
            buttonText: "Save Changes",
          )
        ]),
      )
    ]);
  }
}
