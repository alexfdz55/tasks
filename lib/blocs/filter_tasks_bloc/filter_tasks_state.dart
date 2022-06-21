part of 'filter_tasks_bloc.dart';

abstract class FilterTasksState extends Equatable {
  const FilterTasksState();

  @override
  List<Object> get props => [];
}

class FilterTasksInitial extends FilterTasksState {}

class FilterResult extends FilterTasksState {
  final List<Task> tasks;

  const FilterResult({required this.tasks});

  @override
  List<Object> get props => [tasks];
}
