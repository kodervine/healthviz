import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/providers/habit_log_provider.dart';
import 'package:healthviz/widgets/common/custom_text.dart';

class HabitLogDetailScreen extends ConsumerWidget {
  final String habitName;

  const HabitLogDetailScreen({super.key, required this.habitName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.read(habitProvider.notifier).getHabit(habitName);

    return Scaffold(
      appBar: AppBar(
        title: Text("$habitName Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$habitName Overview",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "You logged ${habit?.value ?? "No data"} for $habitName.",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Pain connection
            CustomText(
              text: "Impact on Pain",
              textSize: 16,
            ),
            const SizedBox(height: 10),
            Text(
              "For example, sleeping less than 6 hours is often correlated with higher pain levels.",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
