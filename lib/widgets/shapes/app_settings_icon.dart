import 'package:flutter/material.dart';

class AppSettingsIcon extends StatelessWidget {
  final VoidCallback? callback;
  const AppSettingsIcon({Key? key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
    );
  }
}
