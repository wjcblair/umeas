import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:umeas/core/presentation/themes/app_themes.dart';

import '../core/presentation/routes/route_manager.dart';

// ignore: use_key_in_widget_constructors
class UmeasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI with Codemagic',
      theme: AppTheme.lightTheme,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splash,
      // locales supported by app
      supportedLocales: AppLocalizations.supportedLocales,
      // these delegates make sure the localization data for the proper language is loaded
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // returns a locale which will be used by the app
      // for (var supportLocale in supportedLocales) {
      //   if (supportedLocale.languageCode == locale.languageCode &&
      //       supportedLocale.countryCode == locale.countryCode) {
      //     return supportedLocale;
      //   }
      // }
      // // if the locale of the device is not supported, use the first one
      // // from the list (English, in this case).
      // return supportedLocales.first;
      // },
    );
  }
}
