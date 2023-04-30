import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _toggle1 = false;
  bool _toggle2 = false;
  bool _toggle3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Settings'),
          SwitchListTile(
            title: const Text('Toggle 1'),
            value: _toggle1,
            onChanged: (bool value) {
              setState(() {
                _toggle1 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Toggle 2'),
            value: _toggle2,
            onChanged: (bool value) {
              setState(() {
                _toggle2 = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Toggle 3'),
            value: _toggle3,
            onChanged: (bool value) {
              setState(() {
                _toggle3 = value;
              });
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
