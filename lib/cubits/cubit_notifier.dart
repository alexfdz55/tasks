import 'package:flutter_bloc/flutter_bloc.dart';

class CubitNotifier<T> extends Cubit<T> {
  CubitNotifier(T initialValue) : super(initialValue);

  T get value => state;

  set value(T arg) {
    emit(arg);
  }
}
