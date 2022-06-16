import 'package:flutter/material.dart';
import 'package:tasks/Values/values.dart';
import 'dart:math' as math;

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const BottomNavigationItem({
    Key? key,
    required this.icon,
    this.isSelected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          children: [
            Positioned(
              top: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                      size: 30,
                      color: !isSelected ? Colors.grey : Colors.white),
                  const SizedBox(height: 25),
                  !isSelected
                      ? const SizedBox(width: 30, height: 30)
                      : Transform.rotate(
                          angle: -math.pi / 4,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: HexColor.fromHex("C25FFF"),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
