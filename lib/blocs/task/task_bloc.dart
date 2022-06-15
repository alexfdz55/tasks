import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/repositories/repositories.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final LocalBDRepository _bdRepository;

  TaskBloc({required LocalBDRepository bdRepository})
      : _bdRepository = bdRepository,
        super(TasksLoading()) {
    on<LoadTasks>(_onLoadTasks);

    // on<CreateTask>(_onCreateTask);

    on<AddTask>(_onAddTask);

    on<UpdateTask>(_onUpdateTask);

    on<RemoveTask>(_onRemoveTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TasksLoading());

    final tasks = await _bdRepository.getTasks();

    // await Future.delayed(const Duration(m));
    emit(TasksLoaded(tasks: tasks));
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    emit(TasksLoading());
    await _bdRepository.addTask(event.task);
    add(LoadTasks());
  }

  // void _onCreateTask(CreateTask event, Emitter<TaskState> emit) async {
  //   emit(TaskShowed(event.task));
  // }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) async {
    emit(TasksLoading());
    await _bdRepository.removeTask(event.task);
    add(LoadTasks());
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    emit(TasksLoading());
    await _bdRepository.updateTask(event.task);
    add(LoadTasks());
  }
}
