import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/models/pain_log.dart';
import 'package:healthviz/providers/pain_log_provider.dart';
import 'package:healthviz/widgets/common/custom_appbar.dart';
import 'package:healthviz/widgets/common/custom_heading.dart';

class PainLogForm extends ConsumerStatefulWidget {
  const PainLogForm({super.key});

  @override
  _PainLogFormState createState() => _PainLogFormState();
}

class _PainLogFormState extends ConsumerState<PainLogForm> {
  double _painLevel = 1.0;
  String _painLocation = '';
  String _painDuration = '';
  String _painType = '';
  String _notes = '';

  final _locations = ['Head', 'Back', 'Stomach', 'Legs'];
  final _painTypes = ['Sharp', 'Dull', 'Throbbing'];

  void _submitLog() {
    final newLog = PainLog(
      painLevel: _painLevel,
      painLocation: _painLocation,
      painDuration: _painDuration,
      painType: _painType,
      notes: _notes,
      date: DateTime.now(),
    );

    ref.read(painLogProvider.notifier).addPainLog(newLog);
    Navigator.of(context).pop(); // Close the screen after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: CustomHeading(text: "Log Pain")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Pain Level: ${_painLevel.toInt()}'),
            Slider(
              value: _painLevel,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (value) {
                setState(() {
                  _painLevel = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: _painLocation.isEmpty ? null : _painLocation,
              items: _locations
                  .map((location) => DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _painLocation = value ?? '';
                });
              },
              decoration: InputDecoration(labelText: 'Pain Location'),
            ),
            DropdownButtonFormField<String>(
              value: _painType.isEmpty ? null : _painType,
              items: _painTypes
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _painType = value ?? '';
                });
              },
              decoration: InputDecoration(labelText: 'Pain Type'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Pain Duration'),
              onChanged: (value) {
                setState(() {
                  _painDuration = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Notes'),
              onChanged: (value) {
                setState(() {
                  _notes = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitLog,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
