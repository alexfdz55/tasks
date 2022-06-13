import 'package:flutter/material.dart';
import 'package:tasks/Values/values.dart';

showAppBottomSheet(
  BuildContext context,
  Widget widget, {
  bool isScrollControlled = false,
  bool popAndShow = false,
  double height = 400,
}) {
  if (popAndShow) Navigator.pop(context);
  // return Get.bottomSheet(
  //     height == null ? widget : Container(height: height, child: widget),
  //     backgroundColor: AppColors.primaryBackgroundColor,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(20),
  //       ),
  //     ),
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     isScrollControlled: isScrollControlled);

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.primaryBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (context) => SizedBox(height: height, child: widget),
  );
}
