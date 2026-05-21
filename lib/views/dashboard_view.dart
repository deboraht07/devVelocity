import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DashboardView extends StatelessWidget {
  final int streakCount;
  final List<Map<String, dynamic>> tasks;

  const DashboardView({
    super.key,
    required this.streakCount,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    final int completedCount = tasks.where((t) => t['isDone'] == true).length;
    final double completionRate = tasks.isEmpty
        ? 0.0
        : completedCount / tasks.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Activity Insights',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text('DevMetrics', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 32),

          // Row 1: Large Performance Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bolt, color: AppTheme.accent, size: 28),
                const SizedBox(height: 16),
                Text(
                  '$streakCount Days Consistent',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppTheme.background),
                ),
                const SizedBox(height: 4),
                Text(
                  'Maintaining peak velocity for the current cycle.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Row 2: Bento Grid Splits
          Expanded(
            child: Row(
              children: [
                // Split Left: Completion Rate
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.border, width: 0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.pie_chart_outline,
                          color: AppTheme.textPrimary,
                          size: 22,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(completionRate * 100).toStringAsFixed(0)}%',
                              style: Theme.of(
                                context,
                              ).textTheme.displayLarge?.copyWith(fontSize: 28),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Sprint Complete',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Split Right: Pure Metrics Raw Numbers
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.border, width: 0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.assignment_turned_in_outlined,
                          color: AppTheme.textPrimary,
                          size: 22,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$completedCount/${tasks.length}',
                              style: Theme.of(
                                context,
                              ).textTheme.displayLarge?.copyWith(fontSize: 28),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Tasks Processed',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
