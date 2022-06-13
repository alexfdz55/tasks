import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/screens/screens.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheets.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/BottomSheets/bottom_sheet_holder.dart';
import 'labelled_option.dart';

import 'create_task.dart';

class DashboardAddBottomSheet extends StatelessWidget {
  const DashboardAddBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      const BottomSheetHolder(),
      AppSpaces.verticalSpace10,
      LabelledOption(
        label: 'Create Task',
        icon: Icons.add_to_queue,
        callback: () => _createTask(context),
      ),
      LabelledOption(
          label: 'Create Project',
          icon: Icons.device_hub,
          callback: () {
            Get.to(() => const CreateProjectScreen());
          }),
      LabelledOption(
          label: 'Create team',
          icon: Icons.people,
          callback: () {
            Get.to(() => SelectMembersScreen());
          }),
      LabelledOption(
          label: 'Create Event',
          icon: Icons.fiber_smart_record,
          callback: () {
            Get.to(() => TaskDueDate());
          }),
    ]);
  }

  void _createTask(BuildContext context) {
    showAppBottomSheet(
      context,
      CreateTaskBottomSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }
}
