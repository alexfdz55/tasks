import 'package:flutter/material.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/models/models.dart';

import 'package:tasks/widgets/tasks/active_task_card.dart';
import 'package:tasks/widgets/tasks/inactive_task_card.dart';
// ignore: depend_on_referenced_packages
export 'package:intl/intl.dart';

class SearchTaskCard extends StatelessWidget {
  final Task task;
  const SearchTaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool newBool = task.isCompleted;
    ValueNotifier<bool> totalDueTrigger = ValueNotifier(newBool);

    return ValueListenableBuilder(
      valueListenable: totalDueTrigger,
      builder: (BuildContext context, _, __) {
        return totalDueTrigger.value
            ? InactiveTaskCard(task: task, notifier: totalDueTrigger)
            : ActiveTaskCard(task: task, notifier: totalDueTrigger);
      },
    );
  }
}
