import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/models/models.dart';
import 'package:tasks/widgets/dummy/green_done_icon.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class InactiveTaskCard extends StatelessWidget {
  final Task task;
  // final ValueNotifier<bool> notifier;
  const InactiveTaskCard({
    Key? key,
    required this.task,
    // required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => notifier.value = !notifier.value,
      onTap: () {
        BlocProvider.of<TaskBloc>(context)
            .add(UpdateTask(task.copyWith(isCompleted: !task.isCompleted)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryBackgroundColor, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryBackgroundColor,
                  ),
                  child: const GreenDoneIcon(),
                ),
                AppSpaces.horizontalSpace20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    Text(
                      task.description ?? '',
                      style:
                          GoogleFonts.lato(color: HexColor.fromHex("5A5E6D")),
                    ),
                    Row(
                      children: [
                        Text(
                          'Prioridad:',
                          style: GoogleFonts.lato(
                              color: HexColor.fromHex("5A5E6D")),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          task.priority.name,
                          style: GoogleFonts.lato(color: task.priority.color),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(DateFormat('MMMM d').format(DateTime.now()),
                style: GoogleFonts.lato(color: HexColor.fromHex("5A5E6D")))
          ],
        ),
      ),
    );
  }
}
