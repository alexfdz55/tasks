import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubits/cubit_notifier.dart';
import 'package:tasks/screens/task_due_date_screen.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/home/sheet_goto_calendar.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SelectDateAndHour extends StatelessWidget {
  final Function(DateTime dateTime) onChanged;
  const SelectDateAndHour({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateNotifier = CubitNotifier<DateTime?>(null);

    return InkWell(
      onTap: () async {
        final date = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TaskDueDateScreen()),
        );

        dateNotifier.value = date;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularCalendarCard(color: HexColor.fromHex("7DBA67")),
          AppSpaces.horizontalSpace10,
          BlocBuilder<CubitNotifier<DateTime?>, DateTime?>(
            bloc: dateNotifier,
            builder: (context, state) => CircularCardLabel(
              label: 'Fecha',
              value: dateNotifier.value == null
                  ? '_______'
                  : DateFormat('dd/MM/y').format(dateNotifier.value!),
              color: HexColor.fromHex("A9F49C"),
            ),
          )
        ],
      ),
    );
  }
}
