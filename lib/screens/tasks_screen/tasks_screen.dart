import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/cubits/cubits.dart';
import 'package:tasks/models/models.dart';
import 'package:tasks/widgets/buttons/primary_tab_buttons.dart';
import 'package:tasks/widgets/forms/search_box.dart';
import 'package:tasks/widgets/custom_error_message.dart';
import 'package:tasks/widgets/tasks/task_card.dart';
import '../../widgets/custom_circular_progress.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  static const String routeName = '/tasks';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => TasksScreen(),
    );
  }

  final _searchController = TextEditingController();
  // final ValueNotifier<int> _settingsButtonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoading) {
          return const CustomCircularProgress();
        }
        if (state is TasksLoaded) {
          final tasks = state.tasks;
          final tasksCompleted =
              tasks.where((task) => task.isCompleted == true).toList();

          final tasksPendenting =
              tasks.where((task) => task.isCompleted == false).toList();

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                children: [
                  _buildSearhBar(),
                  AppSpaces.verticalSpace10,
                  _buildTaskTabs(),
                  AppSpaces.verticalSpace20,
                  BlocBuilder<TaskTabsCubit, TaskTabs>(
                    builder: (context, state) {
                      switch (state) {
                        case TaskTabs.todas:
                          return _buildTasks(tasks);
                        case TaskTabs.restantes:
                          return _buildTasks(tasksPendenting);
                        case TaskTabs.completadas:
                          return _buildTasks(tasksCompleted);
                        default:
                          return _buildTasks(tasks);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const CustomErrorMessage();
        }
      },
    );
  }

  Widget _buildTasks(List<Task> tasks) {
    return BlocBuilder<SearchTaskBloc, SearchTaskState>(
      builder: (context, state) {
        _searchController.addListener(
          () => BlocProvider.of<SearchTaskBloc>(context).add(
            SearchTask(_searchController.text, tasks),
          ),
        );

        if (state is SearchTaskInitial) {
          return Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) => TaskCard(task: tasks[index]),
            ),
          );
        }
        if (state is SearchResult) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (_, index) => TaskCard(task: state.tasks[index]),
            ),
          );
        } else {
          return const CustomErrorMessage();
        }
      },
    );
  }

  Widget _buildSearhBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: SearchBox(
              placeholder: 'Buscar Tarea',
              controller: _searchController,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: 60,
              child: Text(
                "Cancelar",
                textAlign: TextAlign.right,
                style: GoogleFonts.lato(
                  color: HexColor.fromHex("616575"),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () => _searchController.clear(),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskTabs() {
    return BlocBuilder<TaskTabsCubit, TaskTabs>(
      builder: (context, state) {
        final taskTabsCubit = BlocProvider.of<TaskTabsCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PrimaryTabButton(
                  buttonText: "Todas",
                  isSelected: state == TaskTabs.todas,
                  callback: () => taskTabsCubit.emit(TaskTabs.todas),

                  // notifier: _settingsButtonTrigger,
                ),
                PrimaryTabButton(
                  buttonText: "Restantes",
                  isSelected: state == TaskTabs.restantes,
                  callback: () => taskTabsCubit.emit(TaskTabs.restantes),

                  // notifier: _settingsButtonTrigger,
                ),
                PrimaryTabButton(
                  buttonText: "Completadas",
                  isSelected: state == TaskTabs.completadas,
                  callback: () => taskTabsCubit.emit(TaskTabs.completadas),

                  // notifier: _settingsButtonTrigger,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
