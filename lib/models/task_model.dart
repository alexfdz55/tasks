import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TaskPriority { max, high, medium, low }

extension TaskPriorityExtension on TaskPriority {
  String get name {
    return ['Maxima', 'Alta', 'Media', 'Baja'][index];
  }

  Color get color =>
      [Colors.red, Colors.orange, Colors.yellow, Colors.brown][index];
}

class Task extends Equatable {
  final String title;
  final String? description;
  final TaskPriority priority;
  final DateTime? dateTime;
  final bool isCompleted;
  const Task({
    required this.title,
    required this.priority,
    this.dateTime,
    this.description,
    this.isCompleted = false,
  });

  @override
  String toString() => title;

  @override
  List<Object?> get props => [
        title,
        description,
        priority,
        dateTime,
        isCompleted,
      ];

  static List<Task> tasks = [
    const Task(
      title: 'Tomar agua',
      description: 'Diariamente',
      priority: TaskPriority.high,
    ),
    const Task(
      title: 'Bajar al perro',
      description: 'Diariamente',
      priority: TaskPriority.medium,
    ),
    const Task(
      title: 'Comprar comida',
      description: '1 vez por semana',
      priority: TaskPriority.max,
    ),
    const Task(
      title: 'Tomar agua',
      description: 'Diariamente',
      priority: TaskPriority.high,
    ),
    Task(
      title: 'Consulta medica',
      priority: TaskPriority.max,
      dateTime: DateTime(2022, 6, 15),
    ),
    const Task(
      title: 'Buscar el gas',
      priority: TaskPriority.high,
      isCompleted: true,
    ),
    const Task(
      title: 'Aprender BLoc',
      priority: TaskPriority.high,
      isCompleted: true,
    ),
  ];
}
