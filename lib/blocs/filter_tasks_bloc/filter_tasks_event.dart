part of 'filter_tasks_bloc.dart';

abstract class FilterTasksEvent extends Equatable {
  const FilterTasksEvent();

  @override
  List<Object?> get props => [];
}

class FilterTasks extends FilterTasksEvent {
  final DateTimeRange? dateRange;
  final TaskPriority? taskPriority;
  final List<Task> tasksBD;

  const FilterTasks({required this.tasksBD, this.dateRange, this.taskPriority});

  @override
  List<Object?> get props => [tasksBD, dateRange, taskPriority];
}
