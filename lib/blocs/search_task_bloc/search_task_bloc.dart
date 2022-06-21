import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks/models/models.dart';

part 'search_task_event.dart';
part 'search_task_state.dart';

class SearchTaskBloc extends Bloc<SearchTaskEvent, SearchTaskState> {
  SearchTaskBloc() : super(SearchTaskInitial()) {
    on<SearchTask>((event, emit) {
      // print(event.query);
      final suggestions = event.tasksBD.where((task) {
        final taskTitle = task.title.toLowerCase();
        final input = event.query.toLowerCase();
        return taskTitle.contains(input);
      }).toList();
      emit(SearchResult(tasks: suggestions));
    });

    on<ResetSearch>(((event, emit) {
      emit(SearchTaskInitial());
    }));
  }
}
