import 'package:flutter/material.dart';

enum DayVote { bad, neutral, good }

extension DayVoteX on DayVote {
  String get scoreLabel => switch (this) {
    DayVote.bad => '-1',
    DayVote.neutral => '0.5',
    DayVote.good => '1',
  };

  String get qualifier => switch (this) {
    DayVote.bad => 'perdue',
    DayVote.neutral => 'poussive',
    DayVote.good => 'formidable',
  };

  IconData get icon => switch (this) {
    DayVote.bad => Icons.thumb_down,
    DayVote.neutral => Icons.sentiment_neutral,
    DayVote.good => Icons.thumb_up,
  };

  Color get color => switch (this) {
    DayVote.bad => Colors.red,
    DayVote.neutral => const Color.fromARGB(128, 76, 175, 80),
    DayVote.good => Colors.green,
  };
}
