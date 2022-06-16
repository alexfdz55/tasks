import 'package:flutter_bloc/flutter_bloc.dart';

enum TaskTabs { todas, restantes, completadas }

class TaskTabsCubit extends Cubit<TaskTabs> {
  TaskTabsCubit() : super(TaskTabs.todas);
  @override
  void emit(TaskTabs state) {
    super.emit(state);
  }
}
