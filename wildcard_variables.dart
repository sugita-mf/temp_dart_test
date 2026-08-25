// ==========================================
// Dart 3.7+ Wildcard Variables Example
// ==========================================

void main() {
  // 1. Record Destructuring
  // Use '_' to discard unused positional values during destructuring
  final (userId, _) = (101, 'unused_session_token');
  print('User ID: $userId');

  // 2. Multiple Wildcard Parameters in Functions/Callbacks
  // Multiple '_' parameters no longer cause duplicate name compilation errors
  void handleEvent(String _, String _) {
    print('Event triggered without using parameter values.');
  }

  // Legacy style:
  // Since '_' was treated as a normal variable name, each unused parameter 
  // required a unique name (_ , __ , ___ , ____).
  void handleEventLegacy(String _, String __, String ___, String ____) {
    print('Event triggered (Legacy style)');
  }

  handleEvent('click_event', 'button_id');

  // 3. Ignored Loop Index
  // Use '_' when the current element or iteration index is not needed
  for (var _ in [1, 2, 3]) {
    print('Processing item...');
  }
}

