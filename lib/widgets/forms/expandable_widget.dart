import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final String title;
  final Widget expandedChild;
  final bool? isChildExpandedOnLoad;

  const ExpandableWidget(
      {super.key,
      required this.title,
      required this.expandedChild,
      this.isChildExpandedOnLoad = false});

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isChildExpandedOnLoad ?? false;
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 0), // remove horizontal padding on expand
          title: Text(widget.title),
          trailing: IconButton(
            icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onPressed: _toggleExpand,
          ),
        ),
        if (_isExpanded) widget.expandedChild,
      ],
    );
  }
}
