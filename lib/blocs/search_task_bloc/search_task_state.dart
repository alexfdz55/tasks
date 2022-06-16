part of 'search_task_bloc.dart';

abstract class SearchTaskState extends Equatable {
  const SearchTaskState();

  @override
  List<Object> get props => [];
}

class SearchTaskInitial extends SearchTaskState {}

class SearchResult extends SearchTaskState {
  final List<Task> tasks;

  const SearchResult({required this.tasks});

  @override
  List<Object> get props => [tasks];
}
