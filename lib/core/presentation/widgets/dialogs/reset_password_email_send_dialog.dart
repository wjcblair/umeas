import 'package:flutter/material.dart';
import 'package:umeas/core/extensions/buildcontext/loc.dart';

import 'generic_dialog.dart';

Future<void> showResetPasswordSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: context.loc.password_reset,
    content: context.loc.password_reset_dialog_prompt,
    optionsBuilder: () => {
      context.loc.ok: null,
    },
  );
}
