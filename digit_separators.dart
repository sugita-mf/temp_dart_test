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

  // Japanese style: 4-digit grouping for Myriads/10,000s (100 Million = 1億)
  static const annualTarget = 1_0000_0000;

  // Decimal separator: Groups fractional values for precision clarity
  static const microSecondRatio = 0.000_001;

  // 2. Hex Literals & Colors
  // Separates Alpha channel (0xFF) from RGB (2F80ED)
  static const primaryColor = Color(0xFF_2F80ED);

  // Separates each ARGB component individually (Alpha_Red_Green_Blue)
  static const secondaryColor = Color(0xFF_2F_80_ED);

  // ❌ Syntax Error: '_' cannot be placed directly after '0x' or '0b'
  // static const badColor = Color(0x_FF_2F_80_ED);

  // Bitmask / Hex representation: 16-bit boundary grouping
  static const systemBitmask = 0xDEAD_BEEF;

  // 3. Binary Literals
  // Bit flags: 4-bit (1 nibble) boundary grouping for high readability
  static const systemFlags = 0b0000_1010_1111_0001;

  // ✕ Bad readability: Arbitrary / inconsistent grouping (Valid syntax, but hard to read)
  static const irregularBinaryFlags = 0b0_0001_01011_1100_01;

  // 〇 Good: 4-bit (1 nibble) boundary grouping
  static const nibbleGroupedFlags = 0b0000_1010_1111_0001;

  // 〇 Good: 8-bit (1 byte) boundary grouping
  static const byteGroupedFlags = 0b00001010_11110001;
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

  // 3. Binary Literals
  final flags = AppConfig.systemFlags;
  final irregularFlags = AppConfig.irregularBinaryFlags;
  final nibbleFlags = AppConfig.nibbleGroupedFlags;
  final byteFlags = AppConfig.byteGroupedFlags;

  print('=== 1. Numbers ===');
  print('Max Cache Size: $limit');
  print('Annual Target: $target');
  print('Microsecond Ratio: $ratio');

  print('\n=== 2. Hex Literals & Colors ===');
  print('Primary Color: 0x${color1.value.toRadixString(16).toUpperCase()}');
  print('Secondary Color: 0x${color2.value.toRadixString(16).toUpperCase()}');
  print('Bitmask: 0x${mask.toRadixString(16).toUpperCase()}');

  print('\n=== 3. Binary Literals ===');
  print('System Flags: 0b${flags.toRadixString(2).padLeft(16, '0')} ($flags)');
  print('Irregular Flags (Evaluates same): 0b${irregularFlags.toRadixString(2).padLeft(16, '0')} ($irregularFlags)');
  print('Nibble Grouped: 0b${nibbleFlags.toRadixString(2).padLeft(16, '0')} ($nibbleFlags)');
  print('Byte Grouped: 0b${byteFlags.toRadixString(2).padLeft(16, '0')} ($byteFlags)');
}