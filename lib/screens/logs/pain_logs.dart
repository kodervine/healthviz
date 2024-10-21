import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/providers/pain_log_provider.dart';
import 'package:healthviz/screens/logs/pain_log_form.dart';
import 'package:healthviz/widgets/common/nothing_found.dart';
import 'package:healthviz/widgets/logs/pain_log_card.dart';

class PainLogsScreen extends ConsumerWidget {
  const PainLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final painLogs = ref.watch(painLogProvider);

    return Scaffold(
      body: painLogs.isEmpty
          ? const NothingFound(value: "No pain logs yet.")
          : ListView.builder(
              itemCount: painLogs.length,
              itemBuilder: (context, index) {
                final log = painLogs[index];
                return PainLogCard(painLog: log);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const PainLogForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
