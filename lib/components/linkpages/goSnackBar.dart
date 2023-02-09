import 'package:flutter/material.dart';

class goSnackBar extends StatelessWidget {
  const goSnackBar({super.key});

  static const String _title = 'Snack Bar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
            useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: goSnackBarWidget(),
        ),
      ),
    );
  }
}

class goSnackBarWidget extends StatelessWidget {
  const goSnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show Snackbar'),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: 'Action',
              onPressed: () {
                // Code to execute.
              },
            ),
            content: const Text('Awesome SnackBar!'),
            duration: const Duration(milliseconds: 1500),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
    );
  }
}
