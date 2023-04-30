import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

Future<T?> overlayPage<T>({
  required BuildContext context,
  required String title,
  required Widget page,
  Widget? customDialog,
}) {
  // Completer to return the result when the dialog is dismissed
  final Completer<T?> completer = Completer<T?>();

  // Declare the closeOverlay function as nullable
  void Function([T? returnValue])? closeOverlay;

  // Create the overlay entry
  final OverlayEntry overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return Stack(
        children: [
          // Create a blur effect using a BackdropFilter
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          // Display the InboxPage
          Center(
            child: page,
          ),
        ],
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
