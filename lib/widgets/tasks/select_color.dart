import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/cubits/cubit_notifier.dart';
import 'package:tasks/values/values.dart';

class SelectColor extends StatelessWidget {
  // final Color color;
  final Function(String hexColor) onChanged;
  const SelectColor({
    Key? key,
    // required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorNotifier = CubitNotifier<Color>(Colors.deepPurple);

    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CubitNotifier<Color>, Color>(
            bloc: colorNotifier,
            builder: (context, state) => Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: state, shape: BoxShape.circle),
              child: const Icon(Icons.color_lens, color: Colors.white),
            ),
          ),
          AppSpaces.horizontalSpace10,
          Text(
            'Color',
            style: GoogleFonts.lato(
                fontSize: 16, color: HexColor.fromHex("626777")),
          ),
        ],
      ),
      onTap: () => _openColorPicker(context, (value) {
        colorNotifier.value = value;
        final hexColor = value.value.toRadixString(16);
        onChanged(hexColor);
        print(value);
      }),
    );
    ;
  }

  _openColorPicker(BuildContext context, Function(Color) onChanged) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: AlertDialog(
          backgroundColor: HexColor.fromHex("#181a1f"),
          title: const Text(
            'Selecciona un color',
          ),
          content: SingleChildScrollView(
            // .copyWith(
            //   backgroundColor: HexColor.fromHex("#181a1f"),
            //   dialogBackgroundColor: HexColor.fromHex("#181a1f"),
            //   dialogTheme: DialogTheme(
            //     backgroundColor: HexColor.fromHex("#181a1f"),
            //   ),
            // ),
            child: ColorPicker(
              enableAlpha: false,
              hexInputBar: false,
              pickerColor: const Color(0xff443a49),
              // onColorChanged: (){},
              onHsvColorChanged: (value) {
                final color = value.toColor();
                onChanged(color);
                // print('color hex: $color');
                // print('int: ${color.value}');
                // print('hex: ${color.value.toRadixString(16)}');
              },
              onColorChanged: (Color value) {},
            ),

            // Use Material color picker:
            //
            // child: MaterialPicker(
            //   pickerColor: pickerColor,
            //   onColorChanged: changeColor,
            //   showLabel: true, // only on portrait mode
            // ),
            //
            // Use Block color picker:
            //
            // child: BlockPicker(
            //   pickerColor: currentColor,
            //   onColorChanged: changeColor,
            // ),
            //
            // child: MultipleChoiceBlockPicker(
            //   pickerColors: currentColors,
            //   onColorsChanged: changeColors,
            // ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                // setState(() => currentColor = Color(0xff443a49));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
