import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../core/day_vote.dart';
import '../../components/day_date_header/day_date_header.dart';
import '../../components/day_vote_button/day_vote_button.dart';
import '../../components/day_vote_result/day_vote_result.dart';
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
  final DateTime _today = DateTime.now();

  String get _dateKey {
    final y = _today.year;
    final m = _today.month.toString().padLeft(2, '0');
    final d = _today.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  @override
  void initState() {
    super.initState();
    _loadTodayVote();
  }

  Future<void> _loadTodayVote() async {
    final entry = await AppDatabase.instance.getVoteForDate(_dateKey);
    if (entry == null || !mounted) return;
    final vote = DayVote.values.where((v) => v.name == entry.vote).firstOrNull;
    if (vote != null) setState(() => _todayVote = vote);
  }

  void _saveDayVote(DayVote vote) {
    setState(() => _todayVote = vote);
    AppDatabase.instance.upsertDayVote(DayVotesCompanion.insert(
      date: _dateKey,
      vote: vote.name,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DayDateHeader(date: _today),
        if (_todayVote == null) ...[
          const Expanded(
            child: Center(
              child: Text(
                JourneePlusOuMoinsStyle.questionText,
                style: JourneePlusOuMoinsStyle.questionTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
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
        ] else ...[
          Expanded(
            child: DayVoteResult(vote: _todayVote!),
          ),
        ],
      ],
    );
  }
}
