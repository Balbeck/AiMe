import 'package:flutter/material.dart';
import 'calendrier_style.dart';

class CalendrierPage extends StatelessWidget {
  static const String routeName = '/calendrier';

  const CalendrierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: CalendrierStyle.titlePadding,
        child: Text(CalendrierStyle.pageTitle),
      ),
    );
  }
}
