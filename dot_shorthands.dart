// ==========================================
// Dart 3.10+ Dot Shorthands Example
// ==========================================

// --- Mock Classes for Pure Dart Execution ---
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
  const EdgeInsets.only({this.left = 0, this.top = 0, this.right = 0, this.bottom = 0});
  static EdgeInsets all(double value) => EdgeInsets.only(left: value, top: value, right: value, bottom: value);
  static EdgeInsets symmetric({double vertical = 0, double horizontal = 0}) =>
      EdgeInsets.only(left: horizontal, top: vertical, right: horizontal, bottom: vertical);
}

// --- Application Code ---

enum Status { active, inactive, pending }

class AppConfig {
  final Status status;
  final EdgeInsets padding;
  final Color themeColor;

  // 1. Default Arguments: Omits 'Status.active'
  const AppConfig({
    required this.status,
    this.padding = .all(16.0), // Omits 'EdgeInsets.all'
    this.themeColor = const Color(0xFF0000FF),
  });

  // 2. Switch Expression: Omits 'Status' prefix for enum cases
  String get label => switch (status) {
        .active => 'System is running',
        .inactive => 'System is paused',
        .pending => 'System is initializing',
      };
}

void main() {
  // 3. Constructor Arguments: Omits 'Status.active'
  final config = AppConfig(
    status: .active,
    padding: .symmetric(horizontal: 24.0), // Omits 'EdgeInsets.symmetric'
  );

  // 4. Static Constructors / Factories: Omits 'Color.fromSeed'
  final primaryColor = Color.fromSeed(0x123456);
  final secondaryColor = .fromSeed(0x654321); // Context type is Color

  // 5. Equality Checks & Ternary Operators
  final bool isActive = config.status == .active;
  final String stateText = config.status == .active ? .active.name : .inactive.name;

  print('Label: ${config.label}');
  print('Is Active: $isActive');
  print('State Text: $stateText');
  print('Color Hex: 0x${secondaryColor.value.toRadixString(16)}');

  // --------------------------------------------------
  // ⚠️ Gotchas & Non-examples (Compile Errors)
  // --------------------------------------------------
  //
  // Dot Shorthands resolve static members ON THE CONTEXT TYPE ITSELF.
  //
  // ❌ Color color = .blue;   
  // Error: Color class has no static member 'blue' (it exists on 'Colors', not 'Color').
  //
  // ❌ IconData icon = .add;  
  // Error: IconData class has no static member 'add' (it exists on 'Icons', not 'IconData').
  //
  // ✅ Correct usage:
  const Color validColor = Colors.blue;
  const IconData validIcon = Icons.add;

  print('Valid Color: ${validColor.value}');
  print('Valid Icon: ${validIcon.codePoint}');
}

