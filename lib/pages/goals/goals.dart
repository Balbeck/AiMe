import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../components/goal_list_item/goal_list_item.dart';
import '../../components/goal_modal/goal_modal.dart';
import '../../components/add_goal_button/add_goal_button.dart';
import 'goals_style.dart';

class GoalsPage extends StatefulWidget {
  static const String routeName = '/goals';

  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  List<Goal> _goals = [];

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final goals = await AppDatabase.instance.getAllGoals();
    if (mounted) setState(() => _goals = goals);
  }

  void _openCreateModal() {
    showDialog(
      context: context,
      builder: (_) => GoalModal(
        onSave: (data) {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          final now = DateTime.now();
          AppDatabase.instance.upsertGoal(GoalsCompanion.insert(
            id: id,
            title: data.title,
            description: data.description,
            dueDate: Value(data.dueDate),
            createdAt: now,
          ));
          setState(() => _goals.insert(0, Goal(
            id: id,
            title: data.title,
            description: data.description,
            dueDate: data.dueDate,
            createdAt: now,
            modifiedAt: null,
          )));
        },
      ),
    );
  }

  void _openEditModal(Goal goal) {
    showDialog(
      context: context,
      builder: (_) => GoalModal(
        goal: goal,
        onSave: (data) {
          final now = DateTime.now();
          AppDatabase.instance.upsertGoal(GoalsCompanion.insert(
            id: goal.id,
            title: data.title,
            description: data.description,
            dueDate: Value(data.dueDate),
            createdAt: goal.createdAt,
            modifiedAt: Value(now),
          ));
          final updated = Goal(
            id: goal.id,
            title: data.title,
            description: data.description,
            dueDate: data.dueDate,
            createdAt: goal.createdAt,
            modifiedAt: now,
          );
          setState(() {
            final index = _goals.indexWhere((g) => g.id == goal.id);
            if (index != -1) _goals[index] = updated;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: GoalsStyle.topPadding),
        Expanded(
          child: ListView.builder(
            itemCount: _goals.length,
            itemBuilder: (context, index) => GoalListItem(
              goal: _goals[index],
              onTap: () => _openEditModal(_goals[index]),
            ),
          ),
        ),
        Padding(
          padding: GoalsStyle.fabPadding,
          child: Align(
            alignment: Alignment.centerRight,
            child: AddGoalButton(onTap: _openCreateModal),
          ),
        ),
      ],
    );
  }
}
