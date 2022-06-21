import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tasks/models/models.dart';

part 'filter_tasks_event.dart';
part 'filter_tasks_state.dart';

class FilterTasksBloc extends Bloc<FilterTasksEvent, FilterTasksState> {
  FilterTasksBloc() : super(FilterTasksInitial()) {
    on<FilterTasksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
