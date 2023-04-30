import 'package:flutter/material.dart';
import '../presentation/colors/app_colors.dart';

mixin OverlayStateMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    removeOverlay();
    super.didChangeDependencies();
  }

  bool get isOverlayShown => _overlayEntry != null;

  void toggleOverlay(Widget child) =>
      isOverlayShown ? removeOverlay() : _insertOverlay(child);

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _dismissibleOverlay(Widget child) => Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: AppColors.barrierColor,
              child: GestureDetector(
                onTap: removeOverlay,
              ),
            ),
          ),
          child,
        ],
      );

  void _insertOverlay(Widget child) {
    _overlayEntry = OverlayEntry(
      builder: (_) => _dismissibleOverlay(child),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }
}
