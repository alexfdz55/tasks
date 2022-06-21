import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/cubits/cubits.dart';
import 'package:tasks/helpers/dateToString.dart';
import 'package:tasks/values/values.dart';
import 'package:tasks/widgets/bottomSheets/bottom_sheet_holder.dart';
import 'package:tasks/widgets/buttons/primary_buttons.dart';
import 'package:tasks/widgets/buttons/text_button.dart';
import 'package:tasks/widgets/checkbox_label_optiond.dart';
import 'package:tasks/widgets/tasks/select_priority.dart';

class FiltersTasksBottomSheet extends StatelessWidget {
  const FiltersTasksBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace20,
      Text('Filtrar por: ',
          style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
      Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Align(
            alignment: Alignment.centerLeft,
            child: SelectPriority(onChanged: (value) {})),
      ),
      AppSpaces.verticalSpace20,
      SelectRangeDate(onChanged: (value) {}),
      AppSpaces.verticalSpace20,
      CheckBoxabelOption(
        label: '    De primera a última',
        icon: Icons.arrow_downward,
        onChanged: (value) {},
      ),
      CheckBoxabelOption(
        label: '    De última a primera',
        icon: Icons.arrow_upward_rounded,
        onChanged: (value) {},
      ),
      // ToggleLabelOption(label: '    Completed', icon: Icons.check_circle),
      // ToggleLabelOption(label: '    Working On', icon: Icons.flag),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppTextButton(
            buttonText: 'Resetear',
            buttonSize: 16,
            callback: () {},
          ),
          AppPrimaryButton(
            buttonHeight: 60,
            buttonWidth: 160,
            buttonText: "Salvar cambios",
            callback: () {},
          )
        ]),
      )
    ]);
  }
}

class SelectRangeDate extends StatelessWidget {
  final Function(DateTimeRange dateRange) onChanged;
  const SelectRangeDate({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rangeDateNotifier = CubitNotifier<DateTimeRange?>(null);
    return InkWell(
      onTap: () async {
        final picked = await showDateRangePicker(
          context: context,
          lastDate: DateTime(DateTime.now().year + 2),
          firstDate: DateTime(DateTime.now().year - 2),
          builder: (context, widget) => Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                background: HexColor.fromHex("#181a1f"),
                // change the border color
                primary: HexColor.fromHex("A9F49C"),
                // change the text color
                onSurface: HexColor.fromHex("A9F49C"),
              ),
            ),
            child: widget!,
          ),
        );
        if (picked != null) {
          rangeDateNotifier.value = picked;
          print(picked);
//             setState(() {
//               startDate = picked.start;
//               endDate = picked.end;
// //below have methods that runs once a date range is picked
//               allWaterBillsFuture = _getAllWaterBillsFuture(
//                   picked.start.toIso8601String(),
//                   picked.end
//                       .add(new Duration(hours: 24))
//                       .toIso8601String());
//             });
        }
      },
      child: BlocBuilder<CubitNotifier<DateTimeRange?>, DateTimeRange?>(
        bloc: rangeDateNotifier,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              children: [
                Text('Filtrar por Fecha',
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
                const Spacer(),
                const Icon(Icons.calendar_today, color: Colors.white),
                if (state != null)
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Fecha inicial',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white),
                          ),
                          AppSpaces.verticalSpace10,
                          Text(dateToString(state.start),
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: HexColor.fromHex("A9F49C"))),
                        ],
                      ),
                      AppSpaces.horizontalSpace20,
                      Column(
                        children: [
                          Text(
                            'Fecha final',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white),
                          ),
                          AppSpaces.verticalSpace10,
                          Text(
                            dateToString(state.end),
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                color: HexColor.fromHex("A9F49C")),
                          ),
                        ],
                      ),
                    ],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
