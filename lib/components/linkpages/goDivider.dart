import 'package:flutter/material.dart';

class goDivider extends StatelessWidget {
  const goDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const <Widget>[
            Expanded(
              child: Card(
                child: SizedBox.expand(),
              ),
            ),
            Divider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
