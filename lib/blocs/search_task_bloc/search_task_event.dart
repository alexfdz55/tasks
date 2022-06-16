part of 'search_task_bloc.dart';

abstract class SearchTaskEvent extends Equatable {
  const SearchTaskEvent();

  @override
  List<Object> get props => [];
}

class SearchTask extends SearchTaskEvent {
  final String query;
  final List<Task> tasksBD;

  const SearchTask(this.query, this.tasksBD);

  @override
  List<Object> get props => [query];
}
