import 'package:hive/hive.dart';
import 'package:tasks/models/task_model.dart';

import 'base_local_bd_repository.dart';

class LocalBDRepository extends BaseLocalBDRepository {
  late Box<Task> _taskBox;

  // List<Task> _tasks = [];

  @override
  Future<void> openBox() async {
    _taskBox = await Hive.openBox<Task>('task');
    // await _taskBox.clear();
    // await _taskBox.add(
    //   Task(
    //     id: '1',
    //     title: 'Tomar agua',
    //     description: 'Diariamente',
    //     hexColor: '6b64d1',
    //     priority: TaskPriority.high.name,
    //   ),
    // );
  }

  @override
  List<Task> getTasks() {
    // _tasks = Task.tasks;
    // return _tasks;
    return _taskBox.values.toList();
  }

  @override
  Future<void> addTask(Task task) async {
    // _tasks.add(task);
    _taskBox.put(task.id, task);
  }

  @override
  Future<void> updateTask(Task task) async {
    // _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
    final tasks = _taskBox.values.toList();
    final index = tasks.indexWhere((element) => task.id == element.id);
    final key = await _taskBox.keyAt(index);
    await _taskBox.put(key, task);
  }

  @override
  Future<void> removeTask(Task task) async {
    // _tasks.remove(task);
    print('delete');
    _taskBox.delete(task.id);
  }

  @override
  Future<void> clearTask() async {
    // _tasks.clear();
    _taskBox.clear();
  }
}
