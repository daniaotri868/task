part of 'typography.dart';


FontWeight get _regular => FontWeight.normal;

FontWeight get _medium => FontWeight.w500;


FontWeight get _bold => FontWeight.bold;


extension FontExt on TextStyle? {

  TextStyle? get b => this?.copyWith(fontWeight: _bold);


  TextStyle? get r => this?.copyWith(fontWeight: _regular);

  TextStyle? get m => this?.copyWith(fontWeight: _medium);




  TextStyle? withColor(Color? color) => this?.copyWith(color: color);
}

abstract class _FontSize {


  static double get headlineLarge => _headlineLargeSize.sp;
  static const double _headlineLargeSize = 32;

  static double get headlineMedium => _headlineMediumFontSize.sp;
  static const double _headlineMediumFontSize = 28;

  static double get headlineSmall => _headlineSmallFontSize.sp;
  static const double _headlineSmallFontSize = 24;




  static double get bodyLarge => _bodyLargeSize.sp;
  static const double _bodyLargeSize = 18;

  static double get bodyMedium => _bodyMediumFontSize.sp;
  static const double _bodyMediumFontSize = 12;

  static double get bodySmall => _bodySmallFontSize.sp;
  static const double _bodySmallFontSize = 11;



  static double get labelLarge => _labelLargeFontSize.sp;
  static const double _labelLargeFontSize = 18;

  static double get labelMedium => _labelMediumFontSize.sp;
  static const double _labelMediumFontSize = 12;

  static double get labelSmall => _labelSmallFontSize.sp;
  static const double _labelSmallFontSize = 11;
}
