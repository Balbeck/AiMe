import 'package:flutter/material.dart';
import '../../core/goal.dart';
import 'goal_modal_style.dart';

class GoalModal extends StatefulWidget {
  final Goal? goal;
  final void Function(GoalFormData data)? onSave;
  final bool readOnly;

  const GoalModal({
    super.key,
    this.goal,
    this.onSave,
    this.readOnly = false,
  });

  @override
  State<GoalModal> createState() => _GoalModalState();
}

class _GoalModalState extends State<GoalModal> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  DateTime? _dueDate;

  bool get _isEditing => widget.goal != null && !widget.readOnly;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.goal?.title ?? '');
    _descController = TextEditingController(
      text: widget.goal?.description ?? '',
    );
    _dueDate = widget.goal?.dueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _onSave() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;
    widget.onSave?.call(
      GoalFormData(
        title: title,
        description: _descController.text.trim(),
        dueDate: _dueDate,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: GoalModalStyle.dialogShape,
      child: Padding(
        padding: GoalModalStyle.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!widget.readOnly) ...[
              Text(
                _isEditing ? GoalModalStyle.editTitle : GoalModalStyle.createTitle,
                style: GoalModalStyle.headerStyle,
              ),
              const SizedBox(height: GoalModalStyle.fieldGap),
            ],
            ConstrainedBox(
              constraints: GoalModalStyle.scrollableConstraints,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _titleController,
                      enabled: !widget.readOnly,
                      maxLines: null,
                      decoration: GoalModalStyle.titleFieldDecoration,
                    ),
                    const SizedBox(height: GoalModalStyle.fieldGap),
                    TextField(
                      controller: _descController,
                      maxLines: widget.readOnly ? null : 3,
                      enabled: !widget.readOnly,
                      decoration: GoalModalStyle.descFieldDecoration,
                    ),
                    const SizedBox(height: GoalModalStyle.fieldGap),
                    GestureDetector(
                      onTap: widget.readOnly ? null : _pickDate,
                      child: Container(
                        padding: GoalModalStyle.datePadding,
                        decoration: GoalModalStyle.dateDecoration,
                        child: Text(
                          _dueDate != null
                              ? '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}'
                              : GoalModalStyle.datePlaceholder,
                          style: _dueDate != null
                              ? GoalModalStyle.dateStyle
                              : GoalModalStyle.datePlaceholderStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GoalModalStyle.buttonGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(widget.readOnly
                      ? GoalModalStyle.closeLabel
                      : GoalModalStyle.cancelLabel),
                ),
                if (!widget.readOnly) ...[
                  const SizedBox(width: GoalModalStyle.actionGap),
                  ElevatedButton(
                    onPressed: _onSave,
                    child: const Text(GoalModalStyle.saveLabel),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
