// ==========================================
// Dart 3.7+ Wildcard Variables Example
// ==========================================

void main() {
  // 1. Record Destructuring
  // Use '_' to discard unused positional values during destructuring
  final (userId, _) = (101, 'unused_session_token');
  print('User ID: $userId');

  // 2. Multiple Wildcard Parameters in Functions/Callbacks

  // Legacy style:
  // Since '_' was treated as a normal variable name, each unused parameter 
  // required a unique name (_ , __ , ___ , ____).
  void handleEventLegacy(String _, String __, String ___, String ____) {
    print('Event triggered (Legacy style)');
  }

  handleEventLegacy('foo', 'bar', 'hoge', 'fuga');

  // Modern style:
  // Multiple '_' parameters no longer cause duplicate name compilation errors
  void handleEventModern(String _, String _, String _, String _) {
    print('Event triggered (Modern style)');
  }

  handleEventModern('foo', 'bar', 'hoge', 'fuga');

  // 3. Ignored Loop Index
  // Use '_' when the current element or iteration index is not needed
  for (var _ in [1, 2, 3]) {
    print('Processing item...');
  }
}

