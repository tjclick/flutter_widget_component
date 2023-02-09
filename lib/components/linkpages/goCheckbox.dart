import 'package:flutter/material.dart';

class goCheckbox extends StatelessWidget {
  const goCheckbox({super.key});

  static const String _title = 'Check Box';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: goCheckboxWidget(),
        ),
      ),
    );
  }
}

class goCheckboxWidget extends StatefulWidget {
  const goCheckboxWidget({super.key});

  @override
  State<goCheckboxWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<goCheckboxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
