import 'package:flutter/material.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.labelColor = Colors.black,
    this.unselectedLabelColor = Colors.grey,
    this.labelStyle,
    // this.indicatorColor = const Color.fromRGBO(7, 95, 142, 1),
    this.indicatorWidth = 2.0,
  });
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final Color labelColor;
  final Color unselectedLabelColor;
  final TextStyle? labelStyle;
  // final Color indicatorColor;
  final double indicatorWidth;

  @override
  Widget build(BuildContext context) {
    assert(tabs.length == tabViews.length,
        'Tabs and tabViews must be of the same length');

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            labelColor: labelColor,
            unselectedLabelColor: unselectedLabelColor,
            labelStyle: labelStyle ??
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: indicatorWidth,
                // color: indicatorColor,
              ),
            ),
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
