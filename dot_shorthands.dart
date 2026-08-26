// ==========================================
// Dart 3.10+ Dot Shorthands Example
// ==========================================

// --------------------------------------------------
// Mock classes mimicking Flutter SDK's actual signatures
// to allow pure Dart runtime execution.
// --------------------------------------------------

class Color {
  final int value;
  const Color(this.value);
  static Color fromSeed(int seed) => Color(seed);
}

abstract class Colors {
  static const blue = Color(0xFF0000FF);
}

class IconData {
  final int codePoint;
  const IconData(this.codePoint);
}

abstract class Icons {
  static const add = IconData(0xe047);
}

class EdgeInsets {
  final double left, top, right, bottom;

  const EdgeInsets.only({
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
  });

  // Defined as a 'const' constructor, mirroring the actual Flutter SDK implementation.
  const EdgeInsets.all(double value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const EdgeInsets.symmetric({double vertical = 0, double horizontal = 0})
      : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  // static const EdgeInsets zero = EdgeInsets.only();
  static const EdgeInsets zero = .only();
}

// --------------------------------------------------
// Application Code
// --------------------------------------------------

enum Status { active, inactive, pending }

class AppConfig {
  final Status status;
  final EdgeInsets padding;
  final Color themeColor;

  // 1. Default Arguments with Dot Shorthands
  const AppConfig({
    required this.status,
    // Const constructor
    // this.padding = const EdgeInsets.all(16.0),
    this.padding = const .all(16.0),
    this.themeColor = const Color(0xFF0000FF),
  });

  // 2. Switch Expression: Omits 'Status' prefix
  // String get label => switch (status) {
  //       Status.active => 'System is running',
  //       Status.inactive => 'System is paused',
  //       Status.pending => 'System is initializing',
  //     };
  String get label => switch (status) {
        .active => 'System is running',
        .inactive => 'System is paused',
        .pending => 'System is initializing',
      };
}

void main() {
  // 3. Constructor Arguments: Omits 'Status.active' & 'EdgeInsets.symmetric'
  // final config = AppConfig(
  //   status: Status.active,
  //   padding: EdgeInsets.symmetric(horizontal: 24.0),
  // );
  final config = AppConfig(
    status: .active,
    padding: .symmetric(horizontal: 24.0),
  );

  // 4. Static Constructors / Factories with Explicit Context Type
  // final Color secondaryColor = Color.fromSeed(0x654321);
  final Color secondaryColor = .fromSeed(0x654321);

  // 5. Equality Checks & Ternary Expression
  // final bool isActive = config.status == Status.active;
  final bool isActive = config.status == .active;
  // final Status currentStatus = config.status == Status.active ? Status.active : Status.inactive;
  final Status currentStatus = config.status == .active ? .active : .inactive;

  print('Label: ${config.label}');
  print('Is Active: $isActive');
  print('Current Status Name: ${currentStatus.name}');
  print('Padding Left: ${config.padding.left}');
  print('Color Hex: 0x${secondaryColor.value.toRadixString(16)}');

  // --------------------------------------------------
  // Valid usage for Colors & Icons (Correct types)
  // --------------------------------------------------
  const Color validColor = Colors.blue;
  const IconData validIcon = Icons.add;

  print('Valid Color: ${validColor.value}');
  print('Valid Icon: ${validIcon.codePoint}');

  // --------------------------------------------------
  // Gotchas & Non-examples (Compile Errors)
  // --------------------------------------------------

  // Gotcha 1: Context Type is required when declaring with 'final'
  // ❌
  // final color1 = .fromSeed(0x123);
  // ⭕️ 
  // final Color color1 = .fromSeed(0x123);

  // Gotcha 2: Static member 'blue' isn't defined for type 'Color' (Use Colors.blue)
  // ❌
  // Color color2 = .blue; 
  // ⭕️ 
  // Color color2 = Colors.blue;

  // Gotcha 3: Static member 'add' isn't defined for type 'IconData' (Use Icons.add)
  // ❌
  // IconData icon3 = .add;
  // ⭕️
  // IconData icon3 = Icons.add;
}