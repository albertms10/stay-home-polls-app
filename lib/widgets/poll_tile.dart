import 'package:flutter/material.dart';
import 'package:stay_home_polls_app/model/poll.dart';
import 'package:stay_home_polls_app/widgets/choice_poll_action.dart';
import 'package:stay_home_polls_app/widgets/slider_poll_action.dart';

class PollTile extends StatelessWidget {
  final Poll poll;

  PollTile({@required this.poll});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              poll.title,
              style: TextStyle(fontSize: 16),
            ),
            if (poll is SliderPoll)
              SliderPollAction(sliderPoll: poll)
            else if (poll is ChoicePoll)
              ChoicePollAction(choicePoll: poll),
          ],
        ),
      ),
    );
  }
}
