import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/helpers/dateToString.dart';
import 'package:tasks/models/models.dart';

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
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
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
                                      Colors.red,
                                      AppColors.lightMauveBackgroundColor
                                    ],
                                  ),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                      ),
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
                                task.priority,
                                style: GoogleFonts.lato(
                                    color: TaskPriority.values
                                        .firstWhere((element) =>
                                            task.priority == element.name)
                                        .color),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: Text(
                    //     task.dateTime == null
                    //         ? ''
                    //         : DateFormat('MMMM d').format(task.dateTime!),
                    //     style:
                    //         GoogleFonts.lato(color: HexColor.fromHex("5A5E6D")),
                    //   ),
                    // ),
                    Column(
                      children: [
                        Icon(Icons.task,
                            size: 40, color: colorFromHex(task.hexColor)!),
                        // Container(
                        //   width: 40,
                        //   height: 40,
                        //   decoration: BoxDecoration(
                        //       color: colorFromHex(task.hexColor)!,
                        //       shape: BoxShape.circle),
                        //   child: Icon(Icons.task, color: colorFromHex(task.hexColor)!),
                        // ),
                        if (task.dateTime != null)
                          Column(
                            children: [
                              AppSpaces.verticalSpace20,
                              Text(
                                dateToString(task.dateTime!),
                                style: GoogleFonts.lato(
                                    color: HexColor.fromHex("5A5E6D")),
                              ),
                              // AppSpaces.verticalSpace20,
                              Text(
                                dateToHourString(context, task.dateTime!),
                                style: GoogleFonts.lato(
                                    color: HexColor.fromHex("5A5E6D")),
                              ),
                            ],
                          )
                      ],
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   top: -100,
              //   right: -100,
              //   child: Transform.rotate(
              //     angle: -math.pi / 4,
              //     child: Container(
              //         width: 180,
              //         height: 180,
              //         color: colorFromHex(task.hexColor)!),
              //   ),
              // ),
              // const Positioned(
              //   top: 20,
              //   right: 20,
              //   child: Icon(Icons.task, color: Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
