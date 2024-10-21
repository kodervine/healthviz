import 'package:flutter/material.dart';
import 'package:healthviz/widgets/home/home_card_container.dart';
import 'package:healthviz/widgets/home/home_card_link.dart';

class HomeLogHabitsCard extends StatelessWidget {
  const HomeLogHabitsCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.logWidget});

  final String title;
  final String imagePath;
  final Widget logWidget;

  @override
  Widget build(BuildContext context) {
    return HomeCardContainer(
      childWidget: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => logWidget,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeCardLink(
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => logWidget,
                  ),
                );
              },
              onPressText: title,
              variant: HomeCardLinkVariant.spaced,
              textSize: 16,
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
