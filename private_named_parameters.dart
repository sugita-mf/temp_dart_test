// ==========================================
// Dart 3.12+ Private Named Parameter Example
// ==========================================

// ✅ Clean signature, zero boilerplate
// Automatically exposes public parameter 'id:' to callers, while keeping '_id' private
class MyWidget {
  final String _id;
  MyWidget({required this._id});
}

void main() {
  // Call using public parameter name 'id:' (WITHOUT leading underscore)
  final widget = MyWidget(id: 'widget_123');

  // Accessible inside same file or via getter if defined
  print('Widget ID: ${widget._id}');
}

