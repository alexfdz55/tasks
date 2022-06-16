import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/home/task_container_image.dart';

class OverviewTaskContainer extends StatelessWidget {
  final Color backgroundColor;
  final String imageUrl;
  final int numberOfItems;
  final String cardTitle;
  final VoidCallback onPressed;
  const OverviewTaskContainer({
    Key? key,
    required this.imageUrl,
    required this.backgroundColor,
    required this.cardTitle,
    required this.numberOfItems,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kBorderRadius = BorderRadius.circular(20.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MaterialButton(
        onPressed: onPressed,
        // splashColor: Colors.red,
        color: AppColors.primaryBackgroundColor,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius),

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          height: 80,
          // decoration: BoxDecoration(
          //     color: AppColors.primaryBackgroundColor,
          //     borderRadius: kBorderRadius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TaskContainerImage(
                    imageUrl: imageUrl,
                    backgroundColor: backgroundColor,
                  ),
                  AppSpaces.horizontalSpace20,
                  Text(cardTitle,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20))
                ],
              ),
              Row(
                children: [
                  Text(
                    numberOfItems.toString(),
                    style: GoogleFonts.lato(
                      color: backgroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  AppSpaces.horizontalSpace20,
                  const Icon(Icons.chevron_right, color: Colors.white, size: 30)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
