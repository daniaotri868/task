import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'font.dart';

TextTheme appTextTheme(BuildContext context, TextTheme base, Color textColor) {
  return base
      .copyWith(
    headlineLarge: base.headlineLarge?.copyWith(
      fontSize: _FontSize.headlineLarge,
      fontWeight: _regular,
    ),
    headlineMedium: base.headlineMedium?.copyWith(
      fontSize: _FontSize.headlineMedium,
      fontWeight: _regular,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      fontSize: _FontSize.headlineSmall,
      fontWeight: _regular,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontSize: _FontSize.bodyLarge,
      fontWeight: _regular,
      letterSpacing: 0.5,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontSize: _FontSize.bodyMedium,
      fontWeight: _regular,
      letterSpacing: 0.25,
    ),
    bodySmall: base.bodySmall?.copyWith(
      fontSize: _FontSize.bodySmall,
      fontWeight: _regular,
      letterSpacing: 0.4,
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontSize: _FontSize.labelLarge,
      fontWeight: _medium,
      letterSpacing: 0.1,
    ),
    labelMedium: base.labelMedium?.copyWith(
      fontSize: _FontSize.labelMedium,
      fontWeight: _medium,
      letterSpacing: 0.5,
    ),
    labelSmall: base.labelSmall?.copyWith(
      fontSize: _FontSize.labelSmall,
      fontWeight: _medium,
      letterSpacing: 0.5,
    ),
  )
      .apply(displayColor: textColor, bodyColor: textColor);
}
