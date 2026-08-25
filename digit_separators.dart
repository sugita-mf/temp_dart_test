// @dart=3.6
// ==========================================
// Dart 3.6+ Digit Separators Example
// ==========================================

// Lightweight Color class so this file runs in pure Dart without Flutter
class Color {
  final int value;
  const Color(this.value);
}

// ✅ Improves readability for large numbers, hex, and binary literals
// Underscores '_' are ignored by the compiler and used purely for visual clarity.
class AppConfig {
  // 1. Numbers (Integers & Decimals)
  // Western style: 3-digit grouping (1 Million)
  static const maxCacheSize = 1_000_000;

  // Japanese style: 4-digit grouping because the unit "Man" (Myriad) has four zeros
  static const annualTarget = 1_0000_0000;

  // Decimal separator: Groups fractional values for precision clarity
  static const microSecondRatio = 0.000_001;

  // 2. Hex Literals & Colors
  // Separates Alpha channel (0xFF) from RGB (2F80ED)
  static const primaryColor = Color(0xFF_2F80ED);

  // Separates each ARGB component individually (Alpha_Red_Green_Blue)
  static const secondaryColor = Color(0xFF_2F_80_ED);

  // ❌ Syntax Error: '_' cannot be placed directly after '0x'
  // static const badColor = Color(0x_FF_2F_80_ED);

  // Bitmask / Hex representation: 16-bit boundary grouping
  static const systemBitmask = 0xDEAD_BEEF;
}

void main() {
  // 1. Numbers
  final limit = AppConfig.maxCacheSize;
  final target = AppConfig.annualTarget;
  final ratio = AppConfig.microSecondRatio;

  // 2. Hex Literals & Colors
  final color1 = AppConfig.primaryColor;
  final color2 = AppConfig.secondaryColor;
  final mask = AppConfig.systemBitmask;

  print('=== 1. Numbers ===');
  print('Max Cache Size: $limit');
  print('Annual Target: $target');
  print('Microsecond Ratio: $ratio');

  print('\n=== 2. Hex Literals & Colors ===');
  print('Primary Color: 0x${color1.value.toRadixString(16).toUpperCase()}');
  print('Secondary Color: 0x${color2.value.toRadixString(16).toUpperCase()}');
  print('Bitmask: 0x${mask.toRadixString(16).toUpperCase()}');
}
