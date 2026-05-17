import 'package:flutter/material.dart';

abstract class JourneePlusOuMoinsStyle {
  static const String pageTitle = 'Journée +/-';
  static const String questionText = 'Quelle est la note\npour cette Journée ?';

  static const TextStyle questionTextStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const EdgeInsets voteRowPadding =
      EdgeInsets.symmetric(horizontal: 16);
}
