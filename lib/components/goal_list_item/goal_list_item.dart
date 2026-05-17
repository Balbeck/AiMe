import 'package:flutter/material.dart';
import '../../core/goal.dart';
import 'goal_list_item_style.dart';

class GoalListItem extends StatelessWidget {
  final Goal goal;
  final VoidCallback onTap;

  const GoalListItem({super.key, required this.goal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: GoalListItemStyle.margin,
        padding: GoalListItemStyle.padding,
        decoration: GoalListItemStyle.decoration,
        child: Text(
          goal.title,
          style: GoalListItemStyle.titleStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
