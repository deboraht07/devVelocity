import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/app_theme.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Navigation tracking indices and sub-view states
  int _selectedIndex = 0;
  bool _showCreateJoinView = false;

  // ==========================================================================
  // LOCAL METRICS & FOCUS ENGINE STATE
  // ==========================================================================
  int _timeLeft = 1500; // Standard 25-minute focus window (in seconds)
  bool _isTimerRunning = false;
  Timer? _timer;

  // Personal task backlog ledger
  final List<Map<String, dynamic>> _tasks = [
    {
      'id': '1',
      'title': 'Optimize database query indexing for e-commerce metrics',
      'tag': 'Database',
      'isDone': true,
    },
    {
      'id': '2',
      'title': 'Implement localized state synchronization',
      'tag': 'Flutter',
      'isDone': false,
    },
    {
      'id': '3',
      'title': 'Refactor state machine blocks for focus timer module',
      'tag': 'Architecture',
      'isDone': false,
    },
  ];

  // Real-time developer diagnostic pipeline logs
  final List<String> _logs = [
    '[SYSTEM] DevVelocity workspace initialization successful.',
    '[CORE] Connected to local reactive state pipeline.',
  ];

  // ==========================================================================
  // SHARED WORKSPACE TELEMETRY DATA
  // ==========================================================================
  final List<Map<String, dynamic>> _sharedProjects = [
    {
      'id': 'p1',
      'name': 'E-Commerce Retail Platform',
      'durationDays': 60,
      'backlog': [
        {
          'id': 't1',
          'title': 'Design high-fidelity checkout wireframes',
          'assignee': 'Sarah (UI/UX)',
          'isDone': true,
        },
        {
          'id': 't2',
          'title': 'Optimize database query indexing for product metrics',
          'assignee': 'Deborah (You)',
          'isDone': true,
        },
        {
          'id': 't3',
          'title': 'Implement localized state synchronization pipeline',
          'assignee': 'Deborah (You)',
          'isDone': false,
        },
        {
          'id': 't4',
          'title': 'Set up Payment Gateway Webhook endpoints',
          'assignee': 'Alex (Backend)',
          'isDone': false,
        },
        {
          'id': 't5',
          'title': 'Refactor core theme engine layout system',
          'assignee': 'Raj (Frontend)',
          'isDone': false,
        },
      ],
    },
    {
      'id': 'p2',
      'name': 'GreenLink Mobile App',
      'durationDays': 45,
      'backlog': [
        {
          'id': 'g1',
          'title': 'Migrate app branding assets to Emerald Green palette',
          'assignee': 'Deborah (You)',
          'isDone': true,
        },
        {
          'id': 'g2',
          'title': 'Configure SQLite offline persistence caching layer',
          'assignee': 'Deborah (You)',
          'isDone': false,
        },
      ],
    },
  ];

  // ==========================================================================
  // BUSINESS LOGIC & STATE MUTATION CONTROLLERS
  // ==========================================================================

  void _toggleTask(String id) {
    setState(() {
      final index = _tasks.indexWhere((t) => t['id'] == id);
      if (index != -1) {
        _tasks[index]['isDone'] = !_tasks[index]['isDone'];
        _logs.insert(
          0,
          '[LOG] Task "${_tasks[index]['title']}" status updated to: ${_tasks[index]['isDone'] ? "COMPLETE" : "INCOMPLETE"}.',
        );
      }
    });
  }

  void _addTask(String title, String tag) {
    setState(() {
      _tasks.insert(0, {
        'id': DateTime.now().toString(),
        'title': title,
        'tag': tag,
        'isDone': false,
      });
      _logs.insert(
        0,
        '[ACTION] Created new task item with context tag [$tag].',
      );
    });
  }

  void _toggleTimer() {
    setState(() {
      if (_isTimerRunning) {
        _timer?.cancel();
        _isTimerRunning = false;
        _logs.insert(0, '[TIMER] Deep work sprint session paused manually.');
      } else {
        _isTimerRunning = true;
        _logs.insert(0, '[TIMER] Deep work execution loop initialized.');
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            if (_timeLeft > 0) {
              _timeLeft--;
            } else {
              _timer?.cancel();
              _isTimerRunning = false;
              _timeLeft = 1500;
              _logs.insert(
                0,
                '[SUCCESS] Deep work execution loop completed cleanly.',
              );
            }
          });
        });
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final mins = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final secs = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  void _toggleSharedTask(String projectId, String taskId) {
    setState(() {
      final project = _sharedProjects.firstWhere((p) => p['id'] == projectId);
      final task = (project['backlog'] as List).firstWhere(
        (t) => t['id'] == taskId,
      );

      task['isDone'] = !task['isDone'];
      _logs.insert(
        0,
        '[LOG] Team Task "${task['title']}" updated to: ${task['isDone'] ? "COMPLETE" : "INCOMPLETE"}.',
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Row(
        children: [
          // Navigational Dock Sidebar Panel
          Container(
            width: 260,
            decoration: const BoxDecoration(
              color: AppTheme.surfaceDark,
              border: Border(
                right: BorderSide(color: AppTheme.border, width: 0.5),
              ),
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.terminal,
                        color: AppTheme.accent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'DevVelocity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'FOR YOU',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                _buildSidebarItem(0, Icons.bar_chart_rounded, 'Dashboard'),
                _buildSidebarItem(1, Icons.layers_outlined, 'Sprint Board'),
                _buildSidebarItem(
                  2,
                  Icons.hourglass_empty_rounded,
                  'Deep Work Focus',
                ),
                _buildSidebarItem(3, Icons.wysiwyg_rounded, 'System Logs'),
                const SizedBox(height: 24),
                Text(
                  'COLLABORATIVE SPACES',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                _buildSidebarItem(4, Icons.hub_outlined, 'Shared Workspaces'),
                const Spacer(),
                Text(
                  'WORKSPACE ACTIVE',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          // Core Central Workspace Container
          Expanded(
            child: Container(
              color: AppTheme.surface,
              padding: const EdgeInsets.all(40.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: _buildCurrentView(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (index != 4) _showCreateJoinView = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[400],
              size: 20,
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[300],
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentView() {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardView();
      case 1:
        return _buildSprintBoardView();
      case 2:
        return _buildFocusView();
      case 3:
        return _buildLogsView();
      case 4:
        return _showCreateJoinView
            ? _buildCreateJoinWorkspaceView()
            : _buildSharedWorkspacesDashboard();
      default:
        return _buildDashboardView();
    }
  }

  Widget _buildDashboardView() {
    final done = _tasks.where((t) => t['isDone']).length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview',
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
        ),
        const Text(
          'Performance Matrix',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            _buildMetricCard(
              'Sprint Velocity',
              '$done/${_tasks.length}',
              'Tasks completed in current session loop',
            ),
            const SizedBox(width: 24),
            _buildMetricCard(
              'Focus Capacity',
              _isTimerRunning ? 'ACTIVE' : 'STANDBY',
              'Real-time state machine configuration status',
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          'Contribution Activity pipeline ',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.border, width: 0.5),
          ),
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: List.generate(42, (index) {
              Color cellColor = Colors.grey[100]!;
              if (index % 7 == 0)
                cellColor = AppTheme.accent.withValues(alpha: 0.2);
              if (index % 5 == 0 && index % 2 == 0)
                cellColor = AppTheme.accent.withValues(alpha: 0.6);
              if (index == 12 || index == 23) cellColor = AppTheme.accent;
              return Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: cellColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, String val, String desc) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.border, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              val,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSprintBoardView() {
    final TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Active Backlog',
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
        ),
        const Text(
          'Sprint Workspace',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter specific code execution task context...',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppTheme.border,
                      width: 0.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                onSubmitted: (v) {
                  if (v.trim().isNotEmpty) {
                    _addTask(v.trim(), 'Feature');
                    controller.clear();
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, idx) {
              final t = _tasks[idx];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.border, width: 0.5),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: t['isDone'],
                      activeColor: AppTheme.accent,
                      onChanged: (_) => _toggleTask(t['id']),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        t['title'],
                        style: TextStyle(
                          fontSize: 14,
                          color: t['isDone']
                              ? AppTheme.textSecondary
                              : AppTheme.textPrimary,
                          decoration: t['isDone']
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        t['tag'],
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
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

  Widget _buildFocusView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              const Text(
                'BLOCK OUT DISTRACTIONS',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Deep Work Execution',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                _formatTime(_timeLeft),
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 110,
                  fontWeight: FontWeight.w200,
                  letterSpacing: -2,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isTimerRunning
                      ? Colors.red[400]
                      : AppTheme.textPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: _toggleTimer,
                child: Text(
                  _isTimerRunning ? 'PAUSE CYCLE' : 'START SPRINT',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Telemetry Feed',
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
        ),
        const Text(
          'System Log Diagnostics',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView.builder(
              itemCount: _logs.length,
              itemBuilder: (context, idx) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    _logs[idx],
                    style: const TextStyle(
                      color: AppTheme.accent,
                      fontFamily: 'Courier',
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSharedWorkspacesDashboard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shared Backlogs',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        'Team Workspaces',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.textPrimary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => setState(() => _showCreateJoinView = true),
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: const Text(
                      'Join / Create Space',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: _sharedProjects.length,
                  itemBuilder: (context, idx) {
                    final project = _sharedProjects[idx];
                    final List backlog = project['backlog'];
                    final totalTasks = backlog.length;
                    final completedTasks = backlog
                        .where((t) => t['isDone'] == true)
                        .length;

                    final double completionPercentage = totalTasks > 0
                        ? (completedTasks / totalTasks)
                        : 0.0;
                    final int progressPercentage = (completionPercentage * 100)
                        .round();
                    final int remainingDaysEst =
                        ((1 - completionPercentage) * project['durationDays'])
                            .round();

                    return Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.border, width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                project['name'],
                                style: const TextStyle(
                                  color: AppTheme.textPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Duration: ${project['durationDays']} Days',
                                  style: const TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              _buildTelemetryItem(
                                'Completed',
                                '$progressPercentage%',
                              ),
                              const SizedBox(width: 32),
                              _buildTelemetryItem(
                                'Est. Remaining',
                                '$remainingDaysEst Days',
                              ),
                              const SizedBox(width: 32),
                              _buildTelemetryItem(
                                'Speed Velocity Rate',
                                '${(completionPercentage * 1.2).toStringAsFixed(1)}x/wk',
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: completionPercentage,
                              backgroundColor: AppTheme.surface,
                              color: AppTheme.accent,
                              minHeight: 6,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Workflow Backlog Tasks',
                            style: TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...backlog.map((task) {
                            final bool isAssignedToMe = task['assignee']
                                .contains('Deborah (You)');

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isAssignedToMe
                                    ? AppTheme.accent.withValues(alpha: 0.04)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: isAssignedToMe
                                    ? Border.all(
                                        color: AppTheme.accent.withValues(
                                          alpha: 0.3,
                                        ),
                                        width: 0.8,
                                      )
                                    : Border.all(
                                        color: Colors.transparent,
                                        width: 0.8,
                                      ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value: task['isDone'],
                                      activeColor: AppTheme.accent,
                                      onChanged: (_) => _toggleSharedTask(
                                        project['id'],
                                        task['id'],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      task['title'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: task['isDone']
                                            ? AppTheme.textSecondary
                                            : AppTheme.textPrimary,
                                        decoration: task['isDone']
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isAssignedToMe
                                          ? AppTheme.accent.withValues(
                                              alpha: 0.12,
                                            )
                                          : AppTheme.surface,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      task['assignee'],
                                      style: TextStyle(
                                        color: isAssignedToMe
                                            ? AppTheme.accent
                                            : AppTheme.textSecondary,
                                        fontSize: 11,
                                        fontWeight: isAssignedToMe
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),

        // AI Analysis Panel Component (Bounded to prevent right horizontal layout overflows)
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.psychology_outlined,
                      color: AppTheme.accent,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: const Text(
                        'Analyze with AI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Review pipeline velocity tracking, compute efficiency indices, and optimize feature sprint distributions.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accent.withValues(alpha: 0.15),
                    foregroundColor: AppTheme.accent,
                    minimumSize: const Size(double.infinity, 46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      _logs.insert(
                        0,
                        '[AI COGNITION] Performance evaluation loop run complete. Suggestions queued.',
                      );
                    });
                  },
                  child: const Text(
                    'Optimize Speed Rate',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTelemetryItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Fallback Route Interface covering missing team workspace workflows
  Widget _buildCreateJoinWorkspaceView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _showCreateJoinView = false),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_rounded,
                color: AppTheme.textSecondary,
                size: 16,
              ),
              const SizedBox(width: 8),
              const Text(
                'Back to Spaces',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Collaboration Hub',
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
        ),
        const Text(
          'Setup Workspace',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.border, width: 0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.create_new_folder_outlined,
                      color: AppTheme.accent,
                      size: 32,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Create unique space',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Initialize an isolated project hub and distribute secure onboarding keys to your development team.',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.textPrimary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        setState(() {
                          _logs.insert(
                            0,
                            '[HUB] New team workspace configuration array allocated.',
                          );
                          _showCreateJoinView = false;
                        });
                      },
                      child: const Text(
                        'Provision New Space',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.border, width: 0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.fluorescent_outlined,
                      color: AppTheme.accent,
                      size: 32,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Join active sync mesh',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Input an active system token invitation to pull remote repository backlogs directly into your layout timeline.',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.surface,
                        foregroundColor: AppTheme.textPrimary,
                        minimumSize: const Size(double.infinity, 46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: AppTheme.border,
                          width: 0.5,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        setState(() {
                          _logs.insert(
                            0,
                            '[HUB] Attempting secure upstream cluster authentication handshake...',
                          );
                          _showCreateJoinView = false;
                        });
                      },
                      child: const Text(
                        'Enter Access Token',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
