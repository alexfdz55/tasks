import 'package:flutter/material.dart';
import 'package:tasks/Values/values.dart';
import 'package:tasks/widgets/home/daily_goal_card.dart';
import 'package:tasks/widgets/home/productivity_chart.dart';

class ProductivityTab extends StatelessWidget {
  const ProductivityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DailyGoalCard(),
        AppSpaces.verticalSpace20,
        ProductivityChart()
      ],
    );
  }
}
