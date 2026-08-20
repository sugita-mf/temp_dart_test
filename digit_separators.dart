// ==========================================
// Dart 3.6+ Digit Separators Example
// ==========================================

// Lightweight Color class so this file runs in pure Dart without Flutter
class Color {
  final int value;
  const Color(this.value);
}

// ✅ Improves readability for large numbers and hex literals
// Underscores '_' are ignored by the compiler and used purely for visual clarity.
class AppConfig {
  // Separates Alpha channel (0xFF) from RGB (2F80ED)
  static const primaryColor = Color(0xFF_2F80ED);

  // Separates each ARGB component individually (Alpha_Red_Green_Blue)
  static const secondaryColor = Color(0xFF_2F_80_ED);

  // Western style: 3-digit grouping (1 Million)
  static const maxCacheSize = 1_000_000;

  // Japanese style: 4-digit grouping for Myriads/10,000s (100 Million = 1億)
  static const annualTarget = 1_0000_0000;

  // Decimal separator: Groups fractional values for precision clarity
  static const microSecondRatio = 0.000_001;

  // Bitmask / Binary representation (Hex): 16-bit boundary grouping
  static const systemBitmask = 0xDEAD_BEEF;
}

void main() {
  // Evaluates identically to 0xFF2F80ED
  final color1 = AppConfig.primaryColor;
  final color2 = AppConfig.secondaryColor;

  // Evaluates identically to 1000000
  final limit = AppConfig.maxCacheSize;

  // Evaluates identically to 100000000
  final target = AppConfig.annualTarget;

  // Evaluates identically to 0.000001
  final ratio = AppConfig.microSecondRatio;

  // Evaluates identically to 0xDEADBEEF (3735928559)
  final mask = AppConfig.systemBitmask;

  print('Primary Color: 0x${color1.value.toRadixString(16).toUpperCase()}');
  print('Secondary Color: 0x${color2.value.toRadixString(16).toUpperCase()}');
  print('Max Cache Size: $limit');
  print('Annual Target: $target');
  print('Microsecond Ratio: $ratio');
  print('Bitmask: 0x${mask.toRadixString(16).toUpperCase()}');
}

