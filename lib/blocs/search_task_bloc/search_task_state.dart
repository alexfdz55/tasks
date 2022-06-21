part of 'search_task_bloc.dart';

abstract class SearchTaskState extends Equatable {
  const SearchTaskState();

  @override
  List<Object> get props => [];
}

class SearchTaskInitial extends SearchTaskState {}

class SearchResult extends SearchTaskState {
  final List<Task> tasks;

  const SearchResult({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}
