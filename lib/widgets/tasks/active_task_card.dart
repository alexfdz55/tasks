import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/models/models.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ActiveTaskCard extends StatelessWidget {
  final Task task;
  // final ValueNotifier<bool> notifier;
  final VoidCallback onDelete;

  const ActiveTaskCard({
    Key? key,
    // required this.notifier,
    required this.task,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
          IconSlideAction(
            //caption: 'More',
            color: HexColor.fromHex("B1FEE2"),
            icon: Icons.share,
            onTap: () {},

            // onTap: () => _showSnackBar('More'),
          ),
          IconSlideAction(
            //caption: 'Delete',
            iconWidget: const Icon(Icons.delete, size: 35),
            color: HexColor.fromHex("F5A3FF"),
            onTap: onDelete,

            // onTap: () => _showSnackBar('Delete'),
          ),
        ],
        child: InkWell(
          // onTap: () => notifier.value = !notifier.value,
          onTap: () => BlocProvider.of<TaskBloc>(context)
              .add(UpdateTask(task.copyWith(isCompleted: !task.isCompleted))),
          child: Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: ClipOval(
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.pink,
                                    AppColors.lightMauveBackgroundColor
                                  ]),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                        style: GoogleFonts.lato(
                          color: HexColor.fromHex("5A5E6D"),
                        ),
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
                ]),
                Text(
                  task.dateTime == null
                      ? ''
                      : DateFormat('MMMM d').format(task.dateTime!),
                  style: GoogleFonts.lato(color: HexColor.fromHex("5A5E6D")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
