import 'package:flutter/material.dart';
import '../../core/day_vote.dart';
import '../day_vote_button/day_vote_button.dart';
import 'day_vote_modal_style.dart';

class DayVoteModal extends StatelessWidget {
  final void Function(DayVote) onVote;

  const DayVoteModal({super.key, required this.onVote});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: DayVoteModalStyle.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DayVoteModalStyle.title,
              style: DayVoteModalStyle.titleStyle,
            ),
            SizedBox(height: DayVoteModalStyle.titleButtonsGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: DayVote.values
                  .map(
                    (vote) => DayVoteButton(
                      icon: vote.icon,
                      backgroundColor: vote.color,
                      onTap: () {
                        Navigator.of(context).pop();
                        onVote(vote);
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
