import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';

class ButtonsTab extends StatelessWidget {
  const ButtonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Buttons'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                child: const Text('Plain Button'),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                },
              ),
              CupertinoButton.filled(
                child: const Text('Filled Button'),
                onPressed: () {
                  Vibration.vibrate();
                },
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
                height: 50,
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.error_outline),
                label: const Text('With Icon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
