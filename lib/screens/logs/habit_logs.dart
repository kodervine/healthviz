import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/providers/habit_log_provider.dart';
import 'package:healthviz/screens/logs/habit_log_detail.dart';
import 'package:healthviz/screens/logs/habit_log_form.dart';
import 'package:healthviz/widgets/common/nothing_found.dart';

class HabitLogsScreen extends ConsumerWidget {
  const HabitLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: habits.isEmpty
            ? const NothingFound(value: "No habit logs yet.")
            : ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return ListTile(
                    title: Text("${habit.habitName}: ${habit.value}"),
                    onTap: () {
                      // Navigate to details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HabitLogDetailScreen(habitName: habit.habitName),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const HabitFormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
