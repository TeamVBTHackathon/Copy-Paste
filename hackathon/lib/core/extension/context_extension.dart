import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowHightValue => height * 0.01;
  double get normalHightValue => height * 0.02;
  double get mediumHightValue => height * 0.04;
  double get highHightValue => height * 0.08;
  double get hightValue => height * 0.2;

  double get lowWidthValue => width * 0.01;
  double get normalWidthValue => width * 0.02;
  double get mediumWidthValue => width * 0.04;
  double get highWidthValue => width * 0.2;
  double get widthValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingHightLow => EdgeInsets.all(lowHightValue);
  EdgeInsets get paddingHightNormal => EdgeInsets.all(normalHightValue);
  EdgeInsets get paddingHightMedium => EdgeInsets.all(mediumHightValue);
  EdgeInsets get paddingHightHigh => EdgeInsets.all(highHightValue);
  EdgeInsets get noPadding => const EdgeInsets.all(0.0);

  EdgeInsets get paddingWithLowLow => EdgeInsets.all(lowWidthValue);
  EdgeInsets get paddingWithLowNormal => EdgeInsets.all(normalWidthValue);
  EdgeInsets get paddingWithLowMedium => EdgeInsets.all(mediumWidthValue);
  EdgeInsets get paddingWithLowHigh => EdgeInsets.all(highWidthValue);
}
