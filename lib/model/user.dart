import 'package:flutter/material.dart';
import 'package:stay_home_polls_app/model/poll.dart';

class User {
  String id;
  String displayName;
  String username;
  List<Poll> polls;

  User({
    @required this.id,
    @required this.displayName,
    @required this.username,
    this.polls,
  });
}
