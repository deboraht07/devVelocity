import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TrackerView extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(String) onToggle;
  final Function(String, String) onAddTask;

  const TrackerView({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onAddTask,
  });

  @override
  State<TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  final TextEditingController _controller = TextEditingController();
  String _selectedTag = 'Flutter';

  void _handleSubmit() {
    if (_controller.text.trim().isEmpty) return;
    widget.onAddTask(_controller.text.trim(), _selectedTag);
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Clean Title Block
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
          child: Text(
            'Workspace Velocity',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        // Native Input Box Card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.border, width: 0.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'What are you shipping today?',
                    hintStyle: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) => _handleSubmit(),
                ),
              ),
              DropdownButton<String>(
                value: _selectedTag,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: AppTheme.textSecondary,
                ),
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                items: <String>['Flutter', 'Python', 'UI/UX', 'Testing'].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) setState(() => _selectedTag = newValue);
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(
                  Icons.arrow_upward_rounded,
                  color: AppTheme.accent,
                  size: 20,
                ),
                onPressed: _handleSubmit,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Scrollable Minimal Task Stream
        Expanded(
          child: ListView.separated(
            itemCount: widget.tasks.length,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            separatorBuilder: (context, index) => const Divider(
              color: AppTheme.border,
              height: 1,
              thickness: 0.5,
            ),
            itemBuilder: (context, index) {
              final task = widget.tasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => widget.onToggle(task['id']),
                      child: Container(
                        margin: const EdgeInsets.only(top: 2),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: task['isDone']
                                ? AppTheme.accent
                                : AppTheme.textSecondary,
                            width: 1.5,
                          ),
                          color: task['isDone']
                              ? AppTheme.accent
                              : Colors.transparent,
                        ),
                        child: task['isDone']
                            ? const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task['title'],
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  decoration: task['isDone']
                                      ? TextDecoration.lineThrough
                                      : null,
                                  color: task['isDone']
                                      ? AppTheme.textSecondary
                                      : AppTheme.textPrimary,
                                ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.surface,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppTheme.border,
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              task['tag'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
