export 'database/app_database.dart' show Goal;

class GoalFormData {
  final String title;
  final String description;
  final DateTime? dueDate;

  const GoalFormData({
    required this.title,
    required this.description,
    this.dueDate,
  });
}
