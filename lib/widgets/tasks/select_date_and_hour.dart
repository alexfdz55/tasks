import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubits/cubit_notifier.dart';
import 'package:tasks/helpers/dateToString.dart';
import 'package:tasks/screens/task_due_date_screen.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/home/sheet_goto_calendar.dart';

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
          MaterialPageRoute(builder: (context) => TaskDueDateScreen()),
        );
        print(date);
        dateNotifier.value = date;
        onChanged(date);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CircularCalendarCard(color: HexColor.fromHex("7DBA67")),
          ),
          AppSpaces.horizontalSpace10,
          BlocBuilder<CubitNotifier<DateTime?>, DateTime?>(
            bloc: dateNotifier,
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularCardLabel(
                  label: 'Fecha',
                  value: dateNotifier.value == null
                      ? '_______'
                      : dateToString(dateNotifier.value!),
                  color: HexColor.fromHex("A9F49C"),
                ),
                if (dateNotifier.value != null)
                  CircularCardLabel(
                    label: 'Hora',
                    value: dateNotifier.value == null
                        ? '00:00'
                        : dateToHourString(context, dateNotifier.value!),
                    color: HexColor.fromHex("A9F49C"),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
