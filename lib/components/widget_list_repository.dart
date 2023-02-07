import 'dart:convert';

class WidgetListRepository {
  List<String> data = [
      "AppBar",
      "BottomNavigationBar",
      "Drawer",
      "SliverAppBar",
      "TabBar",
      "TabBarView",
      "TabController",
      "TabPageSelector",
      "DropdownButton",
      "ElevatedButton",
      "FloatingActionButton",
      "IconButton",
      "OutlinedButton",
      "PopupMenuButton",
      "TextButton",
      "Checkbox",
      "Date & Time Pickers",
      "Radio",
      "Slider",
      "Switch",
      "TextField",
      "AlertDialog",
      "BottomSheet",
      "ExpansionPanel",
      "SimpleDialog",
      "SnackBar",
      "Card",
      "Chip",
      "CircularProgressIndicator",
      "DataTable",
      "GridView",
      "Icon",
      "Image",
      "LinearProgressIndicator",
      "Tooltip",
      "Divider",
      "ListTile",
      "Stepper",
  ];

  Future<List<String>> loadContentsFromCatagory() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return data;
  }
}
