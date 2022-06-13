import 'package:flutter/material.dart';
import 'package:tasks/widgets/Shapes/roundedborder_with_icon.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: const RoundedBorderWithIcon(icon: Icons.arrow_back),
    );
  }
}
