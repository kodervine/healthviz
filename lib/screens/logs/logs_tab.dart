import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/screens/logs/habit_logs.dart';
import 'package:healthviz/screens/logs/pain_logs.dart';
import 'package:healthviz/widgets/common/custom_tabview.dart';

class LogsTabScreen extends StatelessWidget {
  const LogsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return const Scaffold(
          body: CustomTabView(
            tabs: [
              Tab(text: 'Pain Tracker'),
              Tab(text: 'Habits'),
            ],
            tabViews: [
              PainLogsScreen(),
              HabitLogsScreen(),
            ],
          ),
        );
      },
    );
  }
}
