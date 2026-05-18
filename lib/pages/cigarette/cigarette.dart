import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../components/cigarette_add_button/cigarette_add_button.dart';
import '../../components/cbd_add_button/cbd_add_button.dart';
import '../../components/cigarette_chart/cigarette_chart.dart';
import 'cigarette_style.dart';

class CigarettePage extends StatefulWidget {
  static const String routeName = '/cigarette';

  const CigarettePage({super.key});

  @override
  State<CigarettePage> createState() => _CigarettePageState();
}

class _CigarettePageState extends State<CigarettePage> {
  List<DateTime> _cigaretteTimestamps = [];
  List<DateTime> _cbdTimestamps = [];
  final DateTime _today = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadToday();
  }

  Future<void> _loadToday() async {
    final cigEntries =
        await AppDatabase.instance.getCigarettesForDate(_today);
    final cbdEntries = await AppDatabase.instance.getCbdForDate(_today);
    if (!mounted) return;
    setState(() {
      _cigaretteTimestamps =
          cigEntries.map((e) => e.timestamp).toList();
      _cbdTimestamps = cbdEntries.map((e) => e.timestamp).toList();
    });
  }

  Future<void> _addCigarette() async {
    await AppDatabase.instance.addCigarette();
    await _loadToday();
  }

  Future<void> _addCbd() async {
    await AppDatabase.instance.addCbd();
    await _loadToday();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: CigaretteStyle.topOffset),
        Expanded(
          flex: 3,
          child: CigaretteChart(
            cigaretteTimestamps: _cigaretteTimestamps,
            cbdTimestamps: _cbdTimestamps,
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: CigaretteStyle.buttonAlignment,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CigaretteAddButton(onTap: _addCigarette),
                const SizedBox(width: CigaretteStyle.buttonSpacing),
                CbdAddButton(onTap: _addCbd),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
