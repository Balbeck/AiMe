import 'package:flutter/material.dart';
import 'cigarette_style.dart';

class CigarettePage extends StatelessWidget {
  static const String routeName = '/cigarette';

  const CigarettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: CigaretteStyle.titlePadding,
        child: Text(CigaretteStyle.pageTitle),
      ),
    );
  }
}
