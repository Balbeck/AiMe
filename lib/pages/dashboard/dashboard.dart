import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../core/day_vote.dart';
import '../../components/week_calendar_row/week_calendar_row.dart';
import '../../components/daily_consumption/daily_consumption.dart';
import '../../components/next_deadline/next_deadline.dart';
import '../../components/goal_modal/goal_modal.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, DayVote?> _weekVotes = {};
  int _cigaretteCount = 0;
  int _cbdCount = 0;
  Goal? _nextDeadline;
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
    _loadData();
  }

  Future<void> _loadData() async {
    final dates = _weekDateKeys;
    final results = await Future.wait([
      AppDatabase.instance.getVotesForDates(dates),
      AppDatabase.instance.getCigarettesForDate(_today),
      AppDatabase.instance.getCbdForDate(_today),
      AppDatabase.instance.getNextDeadline(),
    ]);
    if (!mounted) return;
    final voteEntries = results[0] as List<DayVoteEntry>;
    final cigEntries = results[1] as List<Cigarette>;
    final cbdEntries = results[2] as List<CbdEntry>;
    final nextDeadline = results[3] as Goal?;
    final votes = <String, DayVote?>{for (final date in dates) date: null};
    for (final entry in voteEntries) {
      votes[entry.date] =
          DayVote.values.where((v) => v.name == entry.vote).firstOrNull;
    }
    setState(() {
      _weekVotes = votes;
      _cigaretteCount = cigEntries.length;
      _cbdCount = cbdEntries.length;
      _nextDeadline = nextDeadline;
    });
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
        const SizedBox(height: 16),
        DailyConsumption(
          cigaretteCount: _cigaretteCount,
          cbdCount: _cbdCount,
        ),
        const SizedBox(height: 16),
        NextDeadline(
          goal: _nextDeadline,
          onGoalTap: _nextDeadline == null
              ? null
              : () => showDialog(
                    context: context,
                    builder: (_) => GoalModal(
                      goal: _nextDeadline,
                      readOnly: true,
                    ),
                  ),
        ),
      ],
    );
  }
}
