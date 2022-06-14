import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/models/models.dart';

import 'package:tasks/widgets/tasks/active_task_card.dart';
import 'package:tasks/widgets/tasks/inactive_task_card.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool newBool = task.isCompleted;
    // ValueNotifier<bool> totalDueTrigger = ValueNotifier(newBool);

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final taskBloc = BlocProvider.of<TaskBloc>(context);

        return task.isCompleted
            ? InactiveTaskCard(
                task: task,
                // notifier: totalDueTrigger,
              )
            : ActiveTaskCard(
                task: task,
                // notifier: totalDueTrigger,
                onDelete: () => taskBloc.add(RemoveTask(task)),
              );

        // return ValueListenableBuilder(
        //   valueListenable: totalDueTrigger,
        //   builder: (BuildContext context, _, __) {
        //     return totalDueTrigger.value
        //         ? InactiveTaskCard(
        //             task: task,
        //             notifier: totalDueTrigger,
        //           )
        //         : ActiveTaskCard(
        //             task: task,
        //             notifier: totalDueTrigger,
        //             onDelete: () => taskBloc.add(RemoveTask(task)),
        //           );
        //   },
        // );
      },
    );
  }
}
