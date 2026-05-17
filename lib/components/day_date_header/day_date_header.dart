import 'package:flutter/material.dart';
import 'day_date_header_style.dart';

class DayDateHeader extends StatelessWidget {
  final DateTime date;

  const DayDateHeader({super.key, required this.date});

  static const List<String> _weekdays = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche',
  ];

  static const List<String> _months = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre',
  ];

  @override
  Widget build(BuildContext context) {
    final weekday = _weekdays[date.weekday - 1];
    final month = _months[date.month - 1];
    final dayLine = '${date.day} $month ${date.year}';

    return Padding(
      padding: DayDateHeaderStyle.padding,
      child: Column(
        children: [
          Text(weekday, style: DayDateHeaderStyle.weekdayStyle),
          Text(dayLine, style: DayDateHeaderStyle.dateStyle),
        ],
      ),
    );
  }
}
