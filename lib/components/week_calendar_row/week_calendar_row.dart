import 'package:flutter/material.dart';
import '../../core/day_vote.dart';
import 'week_calendar_row_style.dart';

class WeekCalendarRow extends StatelessWidget {
  final Map<String, DayVote?> weekVotes;
  final DateTime today;
  final VoidCallback? onTodayTap;

  const WeekCalendarRow({
    super.key,
    required this.weekVotes,
    required this.today,
    this.onTodayTap,
  });

  static const _dayLetters = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  String _dateKey(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$d';
  }

  @override
  Widget build(BuildContext context) {
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final todayKey = _dateKey(today);

    return Padding(
      padding: WeekCalendarRowStyle.rowPadding,
      child: Row(
        children: List.generate(7, (i) {
          final day = monday.add(Duration(days: i));
          final dateKey = _dateKey(day);
          final vote = weekVotes[dateKey];
          final isToday = dateKey == todayKey;

          return Expanded(
            child: GestureDetector(
              onTap: isToday ? onTodayTap : null,
              child: Container(
                height: WeekCalendarRowStyle.cellHeight,
                margin: WeekCalendarRowStyle.cellMargin,
                decoration: BoxDecoration(
                  color: vote != null
                      ? vote.color
                      : WeekCalendarRowStyle.emptyCellColor,
                  borderRadius: WeekCalendarRowStyle.cellBorderRadius,
                  border: isToday ? WeekCalendarRowStyle.todayBorder : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: WeekCalendarRowStyle.labelPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _dayLetters[i],
                            style: WeekCalendarRowStyle.dayLetterStyle,
                          ),
                          Text(
                            '${day.day}',
                            style: WeekCalendarRowStyle.dayNumberStyle,
                          ),
                        ],
                      ),
                    ),
                    if (vote != null)
                      Expanded(
                        child: Center(
                          child: Icon(
                            vote.icon,
                            size: WeekCalendarRowStyle.iconSize,
                            color: WeekCalendarRowStyle.iconColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
