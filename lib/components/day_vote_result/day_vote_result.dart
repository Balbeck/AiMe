import 'package:flutter/material.dart';
import '../../core/day_vote.dart';
import 'day_vote_result_style.dart';

class DayVoteResult extends StatelessWidget {
  final DayVote vote;

  const DayVoteResult({super.key, required this.vote});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DayVoteResultStyle.messageFirstLine,
            style: DayVoteResultStyle.messageStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            vote.qualifier,
            style: DayVoteResultStyle.qualifierStyle,
          ),
          const SizedBox(height: DayVoteResultStyle.messageScoreGap),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: DayVoteResultStyle.displaySize,
                height: DayVoteResultStyle.displaySize,
                decoration: DayVoteResultStyle.scoreCircleDecoration,
                child: Center(
                  child: Text(
                    vote.scoreLabel,
                    style: DayVoteResultStyle.scoreLabelStyle,
                  ),
                ),
              ),
              const SizedBox(width: DayVoteResultStyle.scoreIconGap),
              Container(
                width: DayVoteResultStyle.displaySize,
                height: DayVoteResultStyle.displaySize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: vote.color,
                ),
                child: Icon(
                  vote.icon,
                  size: DayVoteResultStyle.innerIconSize,
                  color: DayVoteResultStyle.innerIconColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
