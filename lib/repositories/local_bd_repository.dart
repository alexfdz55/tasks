import 'package:tasks/models/task_model.dart';

import 'base_local_bd_repository.dart';

class LocalBDRepository extends BaseLocalBDRepository {
  List<Task> _tasks = [];

  @override
  Future<List<Task>> getTasks() async {
    _tasks = Task.tasks;
    return _tasks;
  }

  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
  }

  @override
  Future<void> removeTask(Task task) async {
    _tasks.remove(task);
  }

  @override
  Future<void> clearTask() async {
    _tasks.clear();
  }
}
