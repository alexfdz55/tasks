import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/values/values.dart';

class PostBottomWidget extends StatelessWidget {
  final String label;
  const PostBottomWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final responsive  = Responsive(context);

    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        width: responsive.width,
        height: 120,
        decoration: BoxDecoration(
            color: AppColors.primaryBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.rotate(
                angle: 195.2,
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.primaryAccentColor,
                        shape: BoxShape.circle),
                    child: const Icon(Icons.attach_file,
                        color: Colors.white, size: 30)),
              ),
              AppSpaces.horizontalSpace20,
              Text(label, style: GoogleFonts.lato(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
