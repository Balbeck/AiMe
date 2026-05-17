import 'package:flutter/material.dart';
import 'parametres_style.dart';

class ParametresPage extends StatelessWidget {
  static const String routeName = '/parametres';

  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: ParametresStyle.titlePadding,
        child: Text(ParametresStyle.pageTitle),
      ),
    );
  }
}
