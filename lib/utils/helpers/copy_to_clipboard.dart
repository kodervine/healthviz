import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthviz/widgets/common/custom_snackbar.dart';

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    CustomSnackBar.showSnackBar(
      context,
      "Copied to clipboard",
    );
  });
}
