import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/cubits/cubits.dart';

// ignore: must_be_immutable
class CheckBoxabelOption extends StatelessWidget {
  final String label;

  final IconData icon;
  final double? margin;
  final Function(bool) onChanged;

  const CheckBoxabelOption(
      {Key? key,
      required this.label,
      required this.icon,
      this.margin,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkNotifier = CubitNotifier<bool>(false);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: margin ?? 8.0),
          child: MergeSemantics(
            child: ListTile(
              title: Row(
                children: [
                  Icon(icon, color: Colors.white, size: 24),
                  Text(label,
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.white)),
                ],
              ),
              trailing: BlocBuilder<CubitNotifier<bool>, bool>(
                bloc: checkNotifier,
                builder: (context, state) => Checkbox(
                    value: state,
                    onChanged: (value) {
                      checkNotifier.value = value!;
                      onChanged(value);
                    }),
              ),
            ),
          ),
        ),
        Divider(height: 1, color: HexColor.fromHex("353742"))
        // Divider(height: 1, color: HexColor.fromHex("616575"))
      ],
    );
  }
}
