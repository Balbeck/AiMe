import 'package:flutter/material.dart';
import 'add_goal_button_style.dart';

class AddGoalButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddGoalButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AddGoalButtonStyle.size,
        height: AddGoalButtonStyle.size,
        decoration: AddGoalButtonStyle.decoration,
        child: const Icon(
          Icons.add,
          size: AddGoalButtonStyle.iconSize,
          color: AddGoalButtonStyle.iconColor,
        ),
      ),
    );
  }
}
