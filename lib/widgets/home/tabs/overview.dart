import 'package:flutter/material.dart';
import 'package:tasks/models/data_model.dart';
import 'package:tasks/models/models.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/home/overview_task_container.dart';
import 'package:tasks/widgets/home/task_progress_card.dart';
import 'package:tcard/tcard.dart';

class ResumenTab extends StatelessWidget {
  const ResumenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic data = AppData.progressIndicatorList;
    final tCardcontroller = TCardController();

    List<Widget> cards = List.generate(
      2,
      (index) => TaskProgressCard(
        cardTitle: data[index]['cardTitle'],
        rating: data[index]['rating'],
        progressFigure: data[index]['progress'],
        percentageGap: int.parse(data[index]['progressBar']),
      ),
    );

    final tasks = Task.tasks;

    final completedTasksNumber =
        tasks.where((task) => task.isCompleted == true).toList().length;

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: TCard(
            controller: tCardcontroller,
            cards: cards,
            onEnd: () {
              tCardcontroller.state!.reset();
            },
          ),
        ),
        AppSpaces.verticalSpace10,
        Column(
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
            OverviewTaskContainer(
              cardTitle: "Proyectos Totales",
              numberOfItems: 8,
              imageUrl: "assets/cone.png",
              backgroundColor: HexColor.fromHex("EDA7FA"),
            ),
          ],
        ),
      ],
    );
  }
}
