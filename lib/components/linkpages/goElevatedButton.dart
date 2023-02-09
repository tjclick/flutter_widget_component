import 'package:flutter/material.dart';

class goElevatedButton extends StatefulWidget {
  const goElevatedButton({super.key});

  @override
  State<goElevatedButton> createState() => _goElevatedButtonState();
}

class _goElevatedButtonState extends State<goElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: null,
            child: const Text('Disabled'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Enabled'),
          ),
        ],
      ),
    );
  }
}
