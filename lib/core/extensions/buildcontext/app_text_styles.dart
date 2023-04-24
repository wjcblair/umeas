import 'package:flutter/material.dart';

import '../../presentation/styles/app_text_styles.dart';

extension CustomTextStyles on BuildContext {
  TextStyle get headline1 => AppTextStyles.headline1;
  TextStyle get headline2 => AppTextStyles.headline2;
  TextStyle get headline3 => AppTextStyles.headline3;
  TextStyle get headline4 => AppTextStyles.headline4;
  TextStyle get headline5 => AppTextStyles.headline5;
  TextStyle get headline6 => AppTextStyles.headline6;
  TextStyle get regularLink => AppTextStyles.regularLink;
  TextStyle get specialLink => AppTextStyles.specialLink;
  TextStyle get paragraph => AppTextStyles.paragraph;
  TextStyle get mutedText => AppTextStyles.mutedText;
  TextStyle get captionHelper => AppTextStyles.captionHelper;
  TextStyle get breadcrumbs => AppTextStyles.breadcrumbs;
  TextStyle get micro => AppTextStyles.micro;
}
