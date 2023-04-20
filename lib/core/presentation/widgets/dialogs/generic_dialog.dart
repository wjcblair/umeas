import 'dart:async';

import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
  Widget? customDialog,
}) {
  // Completer to return the result when the dialog is dismissed
  final Completer<T?> completer = Completer<T?>();

  // Declare the closeOverlay function as nullable
  void Function([T? returnValue])? closeOverlay;

  // Create the overlay entry
  final OverlayEntry overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => closeOverlay?.call(),
        child: Material(
          color: Colors.black54,
          child: Center(
            child: GestureDetector(
              onTap: () {},
              child: customDialog ??
                  AlertDialog(
                    title: Text(title),
                    content: Text(content),
                    actions: optionsBuilder().keys.map((optionTitle) {
                      final value = optionsBuilder()[optionTitle];
                      return TextButton(
                        onPressed: () => closeOverlay?.call(value),
                        child: Text(optionTitle),
                      );
                    }).toList(),
                  ),
            ),
          ),
        ),
      );
    },
  );

  // Assign the closeOverlay function after creating the overlayEntry
  closeOverlay = ([T? returnValue]) {
    overlayEntry.remove();
    completer.complete(returnValue);
  };

  // Add the overlay entry to the overlay
  Overlay.of(context).insert(overlayEntry);

  // Return the future that completes when the dialog is dismissed
  return completer.future;
}
