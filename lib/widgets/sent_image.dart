import 'package:flutter/material.dart';

class SentImage extends StatelessWidget {
  final String image;
  const SentImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
              width: 200, fit: BoxFit.fitWidth, image: AssetImage(image))),
    );
  }
}
