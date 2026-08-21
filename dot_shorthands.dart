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

  static const EdgeInsets zero = EdgeInsets.only();
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
    this.padding = const .all(16.0), // Valid because EdgeInsets.all is a const constructor
    this.themeColor = const Color(0xFF0000FF),
  });

  // 2. Switch Expression: Omits 'Status' prefix
  String get label => switch (status) {
        .active => 'System is running',
        .inactive => 'System is paused',
        .pending => 'System is initializing',
      };
}

void main() {
  // 3. Constructor Arguments: Omits 'Status.active' & 'EdgeInsets.symmetric'
  final config = AppConfig(
    status: .active,
    padding: .symmetric(horizontal: 24.0),
  );

  // 4. Static Constructors / Factories with Explicit Context Type
  final Color secondaryColor = .fromSeed(0x654321);

  // 5. Equality Checks & Ternary Expression
  final bool isActive = config.status == .active;
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
  // Uncomment the lines inside these closures to test compiler behavior!
  // --------------------------------------------------

  // 1. Context Type is required when declaring with 'final'
  final compileErrorInferType = () {
    // ❌ Error: No type was provided to find the dot shorthand 'fromSeed'.
    // final color = .fromSeed(0x123); 
  };

// 2. Cannot access members on non-existent types (e.g., Colors vs Color / Icons vs IconData)
  final compileErrorMissingMemberOnColor = () {
    // ❌ Error: The static getter 'blue' isn't defined for the type 'Color'.
    // Reason: Dot shorthand looks for 'Color.blue' (Color vs Colors).
    // Color color = .blue; 
  };

  final compileErrorMissingMemberOnIconData = () {
    // ❌ Error: The static getter 'add' isn't defined for the type 'IconData'.
    // Reason: Dot shorthand looks for 'IconData.add' (IconData vs Icons).
    // IconData icon = .add; 
  };

  // Avoid unused variable warnings
  compileErrorInferType;
  compileErrorMissingMemberOnColor;
  compileErrorMissingMemberOnIconData;
}