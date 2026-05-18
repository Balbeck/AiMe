import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import 'next_deadline_style.dart';

class NextDeadline extends StatelessWidget {
  final Goal? goal;
  final VoidCallback? onGoalTap;

  const NextDeadline({super.key, required this.goal, this.onGoalTap});

  int _daysRemaining(DateTime dueDate) {
    final today = DateTime.now();
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
    final now = DateTime(today.year, today.month, today.day);
    return due.difference(now).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: NextDeadlineStyle.containerMargin,
      padding: NextDeadlineStyle.padding,
      decoration: NextDeadlineStyle.containerDecoration,
      child: goal == null
          ? Center(
              child: Text(
                NextDeadlineStyle.emptyMessage,
                style: NextDeadlineStyle.emptyStyle,
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        NextDeadlineStyle.deadlineLabel,
                        style: NextDeadlineStyle.labelStyle,
                      ),
                      const SizedBox(height: NextDeadlineStyle.labelTitleGap),
                      GestureDetector(
                        onTap: onGoalTap,
                        child: Container(
                          padding: NextDeadlineStyle.titlePadding,
                          decoration: NextDeadlineStyle.titleDecoration,
                          child: Text(
                            goal!.title,
                            style: NextDeadlineStyle.titleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: NextDeadlineStyle.itemSpacing),
                Container(
                  width: NextDeadlineStyle.daysBadgeSize,
                  height: NextDeadlineStyle.daysBadgeSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: NextDeadlineStyle.daysBorderColor,
                      width: NextDeadlineStyle.daysBorderWidth,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${_daysRemaining(goal!.dueDate!)}${NextDeadlineStyle.daysSuffix}',
                      style: NextDeadlineStyle.daysStyle,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
