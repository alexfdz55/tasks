import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavTabs { home, projects, events, tasks }

class BottomNavCubit extends Cubit<BottomNavTabs> {
  BottomNavCubit() : super(BottomNavTabs.home);
  @override
  void emit(BottomNavTabs state) {
    super.emit(state);
  }
}
