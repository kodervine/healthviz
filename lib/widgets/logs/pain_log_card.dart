import 'package:flutter/material.dart';
import 'package:healthviz/models/pain_log.dart';
import 'package:healthviz/screens/logs/pain_log_detail.dart';
import 'package:healthviz/widgets/forms/custom_button.dart';

class PainLogCard extends StatelessWidget {
  final PainLog painLog;
  const PainLogCard({super.key, required this.painLog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to PainLogDetail screen with details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PainLogDetail(painLog: painLog),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0DE9E9E9),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pain Level: ${painLog.painLevel}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Location: ${painLog.painLocation}'),
            Text('Type: ${painLog.painType}'),
            Text('Date: ${painLog.date}'),
            const SizedBox(height: 8),
            CustomButton(
              text: "More Details",
              bgColor: const Color.fromARGB(255, 247, 202, 255),
              handlePress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PainLogDetail(
                      painLog: painLog,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
