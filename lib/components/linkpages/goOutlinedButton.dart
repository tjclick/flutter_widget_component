import 'package:flutter/material.dart';

class goOutlinedButton extends StatelessWidget {
  const goOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      child: const Text('Click Me'),
    );
  }
}
