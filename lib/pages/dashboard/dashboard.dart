import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../core/day_vote.dart';
import '../../components/week_calendar_row/week_calendar_row.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, DayVote?> _weekVotes = {};
  final DateTime _today = DateTime.now();

  List<String> get _weekDateKeys {
    final monday = _today.subtract(Duration(days: _today.weekday - 1));
    return List.generate(7, (i) {
      final day = monday.add(Duration(days: i));
      final m = day.month.toString().padLeft(2, '0');
      final d = day.day.toString().padLeft(2, '0');
      return '${day.year}-$m-$d';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadWeekVotes();
  }

  Future<void> _loadWeekVotes() async {
    final dates = _weekDateKeys;
    final entries = await AppDatabase.instance.getVotesForDates(dates);
    if (!mounted) return;
    final votes = <String, DayVote?>{for (final date in dates) date: null};
    for (final entry in entries) {
      votes[entry.date] =
          DayVote.values.where((v) => v.name == entry.vote).firstOrNull;
    }
    setState(() => _weekVotes = votes);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeekCalendarRow(
          weekVotes: _weekVotes,
          today: _today,
        ),
      ],
    );
  }
}
