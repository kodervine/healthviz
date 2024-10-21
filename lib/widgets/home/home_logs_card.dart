import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/widgets/common/custom_heading.dart';
import 'package:healthviz/widgets/common/custom_text.dart';

class HomeLogsCard extends ConsumerWidget {
  const HomeLogsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "This Week's Summary",
          color: Color(0XFF262626),
          textSize: 16,
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusCard(
                context,
                icon: Icons.local_hospital_outlined,
                title: 'Pain Level',
                value: '90%',
              ),
              const SizedBox(width: 16),
              _buildStatusCard(
                context,
                icon: Icons.bed_outlined,
                title: 'Sleep',
                value: '8 hours',
              ),
              const SizedBox(width: 16),
              _buildStatusCard(
                context,
                icon: Icons.run_circle_outlined,
                title: 'Exercise',
                value: '5/7',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatusCard(BuildContext context,
      {required IconData icon, required String title, required String value}) {
    return SizedBox(
      width: 110,
      child: Card(
        color: const Color.fromARGB(255, 222, 210, 255).withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 24,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomHeading(
                text: title,
                textSize: 16,
              ),
              const SizedBox(height: 5),
              CustomText(
                text: value,
                color: Colors.grey,
                textSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
