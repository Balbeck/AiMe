import 'package:flutter/material.dart';

abstract class GoalModalStyle {
  static const String createTitle = 'Nouveau Todo';
  static const String editTitle = 'Modifier le Todo';
  static const String titleHint = 'Titre';
  static const String descHint = 'Description';
  static const String datePlaceholder = 'Date butoir (optionnelle)';
  static const String cancelLabel = 'Annuler';
  static const String saveLabel = 'Enregistrer';

  static const ShapeBorder dialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  );

  static const EdgeInsets padding = EdgeInsets.all(24.0);
  static const double fieldGap = 12.0;
  static const double buttonGap = 20.0;
  static const double actionGap = 8.0;

  static const TextStyle headerStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const InputDecoration titleFieldDecoration = InputDecoration(
    hintText: titleHint,
    border: OutlineInputBorder(),
  );

  static const InputDecoration descFieldDecoration = InputDecoration(
    hintText: descHint,
    border: OutlineInputBorder(),
  );

  static const EdgeInsets datePadding = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 14.0,
  );

  static const BoxDecoration dateDecoration = BoxDecoration(
    border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  );

  static const TextStyle dateStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black87,
  );

  static const TextStyle datePlaceholderStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.grey,
  );
}
