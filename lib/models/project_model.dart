import 'package:equatable/equatable.dart';

import 'task_model.dart';

enum ProjectPriority { max, high, medium, low }

class Project extends Equatable {
  final String name;
  final String? description;
  final List<Task>? tasks;
  final ProjectPriority priority;
  final DateTime? initialDate;
  final DateTime? finalDate;
  final bool completed;

  const Project({
    required this.name,
    this.description,
    this.tasks,
    required this.priority,
    this.initialDate,
    this.finalDate,
    this.completed = false,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        tasks,
        priority,
        initialDate,
        finalDate,
        completed,
      ];
}
