import 'package:flutter/material.dart';

class goRadio extends StatelessWidget {
  const goRadio({super.key});

  static const String _title = 'Radio';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: goRadioWidget(),
        ),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class goRadioWidget extends StatefulWidget {
  const goRadioWidget({super.key});

  @override
  State<goRadioWidget> createState() => _goRadioWidgetState();
}

class _goRadioWidgetState extends State<goRadioWidget> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
