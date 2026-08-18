// ==========================================
// Dart 3.10+ Dot Shorthands Example
// ==========================================

enum Status { active, inactive, pending }

class AppConfig {
  final Status status;
  AppConfig({required this.status});
}

void main() {
  // Old Syntax: final config = AppConfig(status: Status.active);
  // New Syntax: Omits explicit type name 'Status'
  final config = AppConfig(status: .active);

  switch (config.status) {
    // Old Syntax: case Status.active:
    case .active:
      print('System is running');

    // Old Syntax: case Status.inactive:
    case .inactive:
      print('System is paused');

    // Old Syntax: case Status.pending:
    case .pending:
      print('System is initializing');
  }
}
