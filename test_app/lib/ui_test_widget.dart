import 'package:cupertino_ui/cupertino_ui.dart' as new_cupertino;
import 'package:flutter/cupertino.dart' as old_cupertino;
import 'package:flutter/material.dart' as old_material;
import 'package:material_ui/material_ui.dart' as new_material;

class UITestWidget extends old_material.StatelessWidget {
  const UITestWidget({super.key});

  @override
  old_material.Widget build(old_material.BuildContext context) {
    return old_material.Column(
      mainAxisSize: old_material.MainAxisSize.min,
      children: [
        old_material.ElevatedButton(
          onPressed: () {},
          child: const old_material.Text('1. Old Material Button'),
        ),
        const old_material.SizedBox(height: 16),
        new_material.ElevatedButton(
          onPressed: () {},
          child: const old_material.Text('2. New Material Button'),
        ),
        const old_material.SizedBox(height: 16),
        old_material.Semantics(
          button: true,
          excludeSemantics: true,
          label: '3. Old Cupertino Button',
          child: old_cupertino.CupertinoButton.filled(
            minimumSize: const old_material.Size(48, 48),
            onPressed: () {},
            child: const old_cupertino.Text('3. Old Cupertino Button'),
          ),
        ),
        const old_material.SizedBox(height: 16),
        old_material.Semantics(
          button: true,
          excludeSemantics: true,
          label: '4. New Cupertino Button',
          child: new_cupertino.CupertinoButton.filled(
            minimumSize: const old_material.Size(48, 48),
            onPressed: () {},
            child: const old_cupertino.Text('4. New Cupertino Button'),
          ),
        ),
      ],
    );
  }
}
