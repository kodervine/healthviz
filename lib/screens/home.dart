import 'package:flutter/material.dart';
import 'package:healthviz/screens/logs/habit_log_form.dart';
import 'package:healthviz/screens/logs/pain_log_form.dart';
import 'package:healthviz/widgets/common/custom_heading.dart';
import 'package:healthviz/widgets/home/home_log_habit_card.dart';
import 'package:healthviz/widgets/home/home_logs_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeading(
              text: "Hi, How are you feeling today?",
              textWeight: FontWeight.w500,
            ),
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  "assets/images/home-banner.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              crossAxisCount: isLandscape
                  ? 1
                  : 2, // This makes sure it's a grid with 2 columns
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: isLandscape ? 6 / 2 : 4 / 5,
              children: const [
                HomeLogHabitsCard(
                  title: "Log Pain Status",
                  imagePath: "assets/images/painlog-writer.png",
                  logWidget: PainLogForm(),
                ),
                HomeLogHabitsCard(
                  title: "Add habit",
                  imagePath: "assets/images/habit-runner.png",
                  logWidget: HabitFormScreen(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const HomeLogsCard(),
          ],
        ),
      ),
    );
  }
}
