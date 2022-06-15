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
  final String id;
  final String title;
  final String? description;
  final TaskPriority priority;
  final DateTime? dateTime;
  final bool isCompleted;
  const Task({
    required this.id,
    required this.title,
    this.priority = TaskPriority.low,
    this.dateTime,
    this.description,
    this.isCompleted = false,
  });

  @override
  String toString() => title;

  Task copyWith({
    String? id,
    String? title,
    String? description,
    TaskPriority? priority,
    DateTime? dateTime,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      dateTime: dateTime ?? this.dateTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        priority,
        dateTime,
        isCompleted,
      ];

  static List<Task> tasks = [
    const Task(
      id: '1',
      title: 'Tomar agua',
      description: 'Diariamente',
      priority: TaskPriority.high,
    ),
    const Task(
      id: '2',
      title: 'Bajar al perro',
      description: 'Diariamente',
      priority: TaskPriority.medium,
    ),
    const Task(
      id: '3',
      title: 'Comprar comida',
      description: '1 vez por semana',
      priority: TaskPriority.max,
    ),
    const Task(
      id: '4',
      title: 'Tomar agua',
      description: 'Diariamente',
      priority: TaskPriority.high,
    ),
    Task(
      id: '4',
      title: 'Consulta medica',
      priority: TaskPriority.max,
      dateTime: DateTime(2022, 6, 15),
    ),
    const Task(
      id: '5',
      title: 'Buscar el gas',
      priority: TaskPriority.high,
      isCompleted: true,
    ),
    const Task(
      id: '6',
      title: 'Aprender BLoc',
      priority: TaskPriority.high,
      isCompleted: true,
    ),
  ];
}
