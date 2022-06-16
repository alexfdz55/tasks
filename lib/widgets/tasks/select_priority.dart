import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/models/models.dart';
import 'package:tasks/values/values.dart';

class SelectPriority extends StatelessWidget {
  final void Function(TaskPriority?)? onChanged;
  const SelectPriority({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priorities = TaskPriority.values.map((e) => e).toList();

    return SizedBox(
      width: 100,
      child: DropdownButtonFormField<TaskPriority>(
        iconSize: 20,
        dropdownColor: AppColors.primaryBackgroundColor,
        iconEnabledColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Prioridad',
          hintStyle: GoogleFonts.lato(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        items: priorities
            .map(
              (priority) => DropdownMenuItem(
                value: priority,
                child: Text(
                  priority.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
