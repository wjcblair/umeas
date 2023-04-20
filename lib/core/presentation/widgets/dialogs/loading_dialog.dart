import 'dart:async';

import 'package:flutter/material.dart';

import 'generic_dialog.dart';

typedef CloseDialog = void Function();

CloseDialog showLoadingDialog({
  required BuildContext context,
  required String text,
}) {
  // Create the loading dialog
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10.0),
        Text(text),
      ],
    ),
  );

  // Declare a completer for the loading dialog
  final Completer<void> completer = Completer<void>();

  // Show the generic dialog with the custom loading dialog and no buttons
  showGenericDialog<void>(
    context: context,
    title: '', // No title needed for the loading dialog
    content: '', // No content text needed for the loading dialog
    optionsBuilder: () => {}, // Empty optionsBuilder, no buttons needed
    customDialog: dialog,
  ).then((_) {
    // When the generic dialog is dismissed, complete the completer
    completer.complete();
  });

  // Return a function to close the loading dialog when needed
  return () {
    // Complete the completer, which triggers the closeOverlay function inside showGenericDialog
    completer.complete();
  };
}
