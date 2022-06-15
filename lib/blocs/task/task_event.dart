part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

// class CreateTask extends TaskEvent {
//   final Task task;

//   const CreateTask(this.task);

//   @override
//   List<Object> get props => [task];
// }

class AddTask extends TaskEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TaskEvent {
  final Task task;

  const RemoveTask(this.task);

  @override
  List<Object> get props => [task];
}
