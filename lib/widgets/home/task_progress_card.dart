import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/values/constants.dart';

class TaskProgressCard extends StatelessWidget {
  final String cardTitle;
  final String rating;
  final double progress;
  const TaskProgressCard({
    Key? key,
    required this.rating,
    required this.cardTitle,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ...progressCardGradientList,
          ],
        ),
      ),
      child: Stack(
        children: [
          // const Positioned(
          //     top: 10, right: 10, child: ProgressCardCloseButton()),
          Positioned(
            top: 30,
            bottom: 20,
            right: 10,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardTitle,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 22)),
                AppSpaces.verticalSpace10,
                Text('$rating is completed',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500, fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 220,
                      height: 10,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                            width: progress * 220 / 100,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox())
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${progress.toStringAsFixed(1)}%",
                      style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
