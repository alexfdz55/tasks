import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

enum TaskPriority { max, high, medium, low }

extension TaskPriorityExtension on TaskPriority {
  String get name {
    return ['Maxima', 'Alta', 'Media', 'Baja'][index];
  }

  Color get color =>
      [Colors.red, Colors.orange, Colors.yellow, Colors.brown][index];
}

@HiveType(typeId: 1)
class Task extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String priority;
  @HiveField(4)
  final DateTime? dateTime;
  @HiveField(5)
  final String hexColor;
  @HiveField(6)
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    this.priority = 'Baja',
    this.dateTime,
    this.description,
    this.hexColor = '673ab7',
    this.isCompleted = false,
  });

  @override
  String toString() => '$title __ $dateTime';

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? priority,
    DateTime? dateTime,
    String? hexColor,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      dateTime: dateTime ?? this.dateTime,
      hexColor: hexColor ?? this.hexColor,
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
        hexColor,
        isCompleted,
      ];

  // static List<Task> tasks = [
  //   Task(
  //     id: '1',
  //     title: 'Tomar agua',
  //     description: 'Diariamente',
  //     hexColor: '6b64d1',
  //     priority: TaskPriority.high,
  //   ),
  //   Task(
  //     id: '2',
  //     title: 'Bajar al perro',
  //     description: 'Diariamente',
  //     hexColor: '6b64d1',
  //     priority: TaskPriority.medium,
  //   ),
  //   Task(
  //     id: '3',
  //     title: 'Comprar comida',
  //     description: '1 vez por semana',
  //     hexColor: '6b64d1',
  //     priority: TaskPriority.max,
  //   ),
  //   Task(
  //     id: '4',
  //     title: 'Tomar agua',
  //     description: 'Diariamente',
  //     hexColor: '6b64d1',
  //     priority: TaskPriority.high,
  //   ),
  //   Task(
  //     id: '5',
  //     title: 'Consulta medica',
  //     priority: TaskPriority.max,
  //     dateTime: DateTime(2022, 6, 15),
  //     hexColor: '6b64d1',
  //   ),
  //   Task(
  //     id: '6',
  //     title: 'Buscar el gas',
  //     priority: TaskPriority.high,
  //     hexColor: '6b64d1',
  //     isCompleted: true,
  //   ),
  //   Task(
  //     id: '7',
  //     title: 'Aprender BLoc',
  //     priority: TaskPriority.high,
  //     hexColor: '6b64d1',
  //     isCompleted: true,
  //   ),
  // ];
}
