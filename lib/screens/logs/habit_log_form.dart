import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/providers/habit_log_provider.dart';
import 'package:healthviz/screens/logs/habit_logs.dart';

class HabitFormScreen extends ConsumerStatefulWidget {
  const HabitFormScreen({super.key});
  @override
  ConsumerState<HabitFormScreen> createState() => _HabitFormScreenState();
}

class _HabitFormScreenState extends ConsumerState<HabitFormScreen> {
  final _sleepController = TextEditingController();
  final _exerciseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Your Habits"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sleepController,
              decoration: const InputDecoration(
                  labelText: "How many hours did you sleep?"),
            ),
            TextField(
              controller: _exerciseController,
              decoration: const InputDecoration(
                  labelText: "How many days did you exercise this week?"),
              minLines: 2,
              maxLines: 2,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save habits to Riverpod
                ref
                    .read(habitProvider.notifier)
                    .addHabit('Sleep', _sleepController.text);
                ref
                    .read(habitProvider.notifier)
                    .addHabit('Exercise', _exerciseController.text);

                // Navigate to summary screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HabitLogsScreen()),
                );
              },
              child: const Text("Save Habits"),
            ),
          ],
        ),
      ),
    );
  }
}
