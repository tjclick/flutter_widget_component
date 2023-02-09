import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

class goPopupMenuButton extends StatefulWidget {
  const goPopupMenuButton({super.key});

  @override
  State<goPopupMenuButton> createState() => _goPopupMenuButtonState();
}

class _goPopupMenuButtonState extends State<goPopupMenuButton> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popup Menu')),
      body: Center(
        child: PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('Item 1'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('Item 2'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('Item 3'),
            ),
          ],
        ),
      ),
    );
  }
}
