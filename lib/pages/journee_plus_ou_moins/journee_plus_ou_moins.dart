import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../core/day_vote.dart';
import '../../components/day_date_header/day_date_header.dart';
import '../../components/day_vote_button/day_vote_button.dart';
import '../../components/day_vote_result/day_vote_result.dart';
import '../../components/day_vote_modal/day_vote_modal.dart';
import '../../components/week_calendar_row/week_calendar_row.dart';
import 'journee_plus_ou_moins_style.dart';

class JourneePlusOuMoinsPage extends StatefulWidget {
  static const String routeName = '/journeeplusoumoins';

  const JourneePlusOuMoinsPage({super.key});

  @override
  State<JourneePlusOuMoinsPage> createState() =>
      _JourneePlusOuMoinsPageState();
}

class _JourneePlusOuMoinsPageState extends State<JourneePlusOuMoinsPage> {
  DayVote? _todayVote;
  Map<String, DayVote?> _weekVotes = {};
  final DateTime _today = DateTime.now();

  String get _dateKey {
    final y = _today.year;
    final m = _today.month.toString().padLeft(2, '0');
    final d = _today.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

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
    setState(() {
      _weekVotes = votes;
      _todayVote = votes[_dateKey];
    });
  }

  void _saveDayVote(DayVote vote) {
    setState(() {
      _todayVote = vote;
      _weekVotes = {..._weekVotes, _dateKey: vote};
    });
    AppDatabase.instance.upsertDayVote(DayVotesCompanion.insert(
      date: _dateKey,
      vote: vote.name,
    ));
  }

  void _openTodayVoteModal() {
    showDialog(
      context: context,
      builder: (_) => DayVoteModal(onVote: _saveDayVote),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DayDateHeader(date: _today),
        if (_todayVote == null) ...[
          const Spacer(),
          const Text(
            JourneePlusOuMoinsStyle.questionText,
            style: JourneePlusOuMoinsStyle.questionTextStyle,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: JourneePlusOuMoinsStyle.voteRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DayVoteButton(
                  icon: DayVote.bad.icon,
                  backgroundColor: DayVote.bad.color,
                  onTap: () => _saveDayVote(DayVote.bad),
                ),
                DayVoteButton(
                  icon: DayVote.neutral.icon,
                  backgroundColor: DayVote.neutral.color,
                  onTap: () => _saveDayVote(DayVote.neutral),
                ),
                DayVoteButton(
                  icon: DayVote.good.icon,
                  backgroundColor: DayVote.good.color,
                  onTap: () => _saveDayVote(DayVote.good),
                ),
              ],
            ),
          ),
          WeekCalendarRow(
            weekVotes: _weekVotes,
            today: _today,
            onTodayTap: _openTodayVoteModal,
          ),
          const Spacer(),
        ] else ...[
          const Spacer(),
          DayVoteResult(vote: _todayVote!),
          const Spacer(),
          WeekCalendarRow(
            weekVotes: _weekVotes,
            today: _today,
            onTodayTap: _openTodayVoteModal,
          ),
          const Spacer(),
        ],
      ],
    );
  }
}
