import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tasks/values/values.dart';

// void changeColor(Color color) {
//     setState(() => pickerColor = color);
//   }

openColorPicker(BuildContext context, Function(Color) onChanged) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: HexColor.fromHex("5E6272"),
      title: const Text('Selecciona un color'),
      content: SingleChildScrollView(
        child: Theme(
          data: ThemeData.dark(),
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
  );
}
