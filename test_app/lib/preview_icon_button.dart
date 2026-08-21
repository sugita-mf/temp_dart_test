import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';


// light mode
Widget lightThemeWrapper(Widget child) {
  return MaterialApp(
    theme: ThemeData.light(useMaterial3: true),
    home: Scaffold(
      body: Center(child: child),
    ),
  );
}

// dark mode
Widget darkThemeWrapper(Widget child) {
  return MaterialApp(
    theme: ThemeData.dark(useMaterial3: true),
    home: Scaffold(
      body: Center(child: child),
    ),
  );
}

// ❌ INCORRECT EXAMPLE:
// Do not use a private function (prefixed with '_').
// Widget Previews generates a separate entrypoint file under the hood.
// Private functions cannot be accessed from outside this file, causing
// 'Error: Undefined name' during generation.
Widget _darkThemeWrapper(Widget child) {
  return MaterialApp(
    theme: ThemeData.dark(useMaterial3: true),
    home: Scaffold(
      body: Center(child: child),
    ),
  );
}

// Custom icon button (Single Widget)
@Preview(name: 'Icon Button Only',
  // widget size
  // width: 200.0,
  // height: 100.0,
  // preview frame size
  // size: Size(300.0, 100.0),
  // wrapper: lightThemeWrapper,
  // wrapper: darkThemeWrapper,
  // ❌ INCORRECT EXAMPLE:
  // wrapper: _darkThemeWrapper,
)
Widget previewIconButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.send),
    label: const Text('Send'),
  );
}
