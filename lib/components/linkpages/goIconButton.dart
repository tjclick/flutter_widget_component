import 'package:flutter/material.dart';

class goIconButton extends StatelessWidget {
  const goIconButton({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: goIconButtonWidget(),
        ),
      ),
    );
  }
}

double _volume = 0.0;

class goIconButtonWidget extends StatefulWidget {
  const goIconButtonWidget({super.key});

  @override
  State<goIconButtonWidget> createState() => _goIconButtonWidgetState();
}

class _goIconButtonWidgetState extends State<goIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              _volume += 10;
            });
          },
        ),
        Text('Volume : $_volume'),
      ],
    );
  }
}
