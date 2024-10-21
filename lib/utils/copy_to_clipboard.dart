import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(BuildContext context, String textToCopy) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Copied to clipboard!')),
  );
}

class CopyableWidget extends StatelessWidget {
  final Widget child;
  final String textToCopy;

  CopyableWidget({required this.child, required this.textToCopy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => copyToClipboard(context, textToCopy),
      child: child,
    );
  }
}
