import 'package:flutter/material.dart';
import 'package:healthviz/models/pain_log.dart';

class PainLogDetail extends StatelessWidget {
  final PainLog painLog;

  const PainLogDetail({super.key, required this.painLog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pain Log Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pain Level: ${painLog.painLevel}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Location: ${painLog.painLocation}'),
            Text('Type: ${painLog.painType}'),
            Text('Date: ${painLog.date}'),
            const SizedBox(height: 20),
            const Text(
              'Notes:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(painLog.notes),
            const SizedBox(height: 20),
            const Text(
              'Recommendation:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Based on your pain level and location, consider gentle stretching exercises and a cold compress.',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add reminder functionality
              },
              child: const Text('Set Reminder to Exercise'),
            ),
          ],
        ),
      ),
    );
  }
}
