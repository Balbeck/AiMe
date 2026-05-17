import 'package:flutter/material.dart';
import 'day_vote_button_style.dart';

class DayVoteButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const DayVoteButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: DayVoteButtonStyle.size,
        height: DayVoteButtonStyle.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          size: DayVoteButtonStyle.iconSize,
          color: DayVoteButtonStyle.iconColor,
        ),
      ),
    );
  }
}
