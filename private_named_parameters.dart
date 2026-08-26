// ==========================================
// Dart 3.12+ Private Named Parameter Example
// ==========================================

// ✅ Clean signature, zero boilerplate
// Automatically exposes public parameter 'id:' to callers, while keeping '_id' private
class MyWidget {
  final String _id;
  MyWidget({required this._id});
}

// Private Named Parameter + Primary Constructor(Dart 3.13)
// class MyWidget({required final String _id});

void main() {
  // Call using public parameter name 'id:' (WITHOUT leading underscore)
  final widget = MyWidget(id: 'widget_123');
  // ❌ Error: No named parameter with the name '_id'.
  // final widget = MyWidget(_id: 'widget_123');

  // Accessible inside same file or via getter if defined
  print('Widget ID: ${widget._id}');
}

