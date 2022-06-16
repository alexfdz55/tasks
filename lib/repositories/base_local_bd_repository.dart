import 'package:tasks/models/models.dart';

abstract class BaseLocalBDRepository {
  Future<void> openBox();
  List<Task> getTasks();
  Future<void> addTask(Task task);
  Future<void> removeTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> clearTask();
}
