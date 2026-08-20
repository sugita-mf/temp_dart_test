import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

// Custom icon button (Single Widget)
@Preview(name: 'Icon Button Only')
Widget previewIconButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.send),
    label: const Text('Send'),
  );
}
