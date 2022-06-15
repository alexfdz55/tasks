import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/models/models.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/custom_circular_progress.dart';
import 'package:tasks/widgets/custom_error_message.dart';
import 'package:tasks/widgets/home/overview_task_container.dart';
import 'package:tasks/widgets/home/task_progress_card.dart';
import 'package:tcard/tcard.dart';

class ResumenTab extends StatelessWidget {
  const ResumenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> cards = List.generate(
    //   2,
    //   (index) => TaskProgressCard(
    //     cardTitle: data[index]['cardTitle'],
    //     rating: data[index]['rating'],
    //     progressFigure: data[index]['progress'],
    //     percentageGap: int.parse(data[index]['progressBar']),
    //   ),
    // );

    return Column(
      children: [
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TasksLoading) {
              return const CustomCircularProgress();
            }

            if (state is TasksLoaded) {
              final tasks = state.tasks;
              return Column(
                children: [
                  _ProgressCards(tasks: tasks),
                  AppSpaces.verticalSpace10,
                  _TaskCards(tasks: tasks),
                ],
              );
            } else {
              return const CustomErrorMessage();
            }
          },
        ),
        OverviewTaskContainer(
          cardTitle: "Proyectos Totales",
          numberOfItems: 8,
          imageUrl: "assets/cone.png",
          backgroundColor: HexColor.fromHex("EDA7FA"),
        ),
      ],
    );
  }
}

class _ProgressCards extends StatelessWidget {
  final List<Task> tasks;
  _ProgressCards({Key? key, required this.tasks}) : super(key: key);
  final tCardcontroller = TCardController();

  @override
  Widget build(BuildContext context) {
    final completedTasksNumber =
        tasks.where((task) => task.isCompleted == true).toList().length;

    List<Widget> cards = [
      TaskProgressCard(
        cardTitle: 'Progeso de Tareas',
        rating: '$completedTasksNumber/${tasks.length}',
        progress: (completedTasksNumber / tasks.length) * 100,
      ),
      TaskProgressCard(
        cardTitle: 'Progreso de Proyectos',
        rating: "3/4",
        progress: 75.00,
      ),
    ];

    return SizedBox(
      height: 150,
      child: TCard(
        controller: tCardcontroller,
        cards: cards,
        onEnd: () {
          tCardcontroller.state!.reset();
        },
      ),
    );
  }
}

class _TaskCards extends StatelessWidget {
  final List<Task> tasks;
  const _TaskCards({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completedTasksNumber =
        tasks.where((task) => task.isCompleted == true).toList().length;
    return Column(
      children: [
        OverviewTaskContainer(
          cardTitle: "Tareas Totales",
          numberOfItems: tasks.length,
          imageUrl: "assets/orange_pencil.png",
          backgroundColor: HexColor.fromHex("EFA17D"),
        ),
        OverviewTaskContainer(
          cardTitle: "Completadas",
          numberOfItems: completedTasksNumber,
          imageUrl: "assets/green_pencil.png",
          backgroundColor: HexColor.fromHex("7FBC69"),
        ),
      ],
    );
  }
}
