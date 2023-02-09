import 'dart:convert';

class WidgetListRepository {
  List<String> data = [
    "AppBar",
    "AlertDialog",
    "BottomNavigationBar",
    "BottomSheet",
    "Checkbox",
    "Card",
    "Chip",
    "CircularProgressIndicator",
    "DropdownButton",
    "Drawer",
    "DataTable",
    "DateTimePickers",
    "Divider",
    "ElevatedButton",
    "ExpansionPanel",
    "FloatingActionButton",
    "GridView",
    "IconButton",
    "ListTile",
    "LinearProgressIndicator",
    "OutlinedButton",
    "PopupMenuButton",
    "Radio",
    "SliverAppBar",
    "Slider",
    "Switch",
    "SimpleDialog",
    "SnackBar",
    "Stepper",
    "TextField",
    "TextButton",
    "TabBar",
    "TabBarView",
    "TabController",
    "Tooltip",
  ];

  Future<List<String>> loadContentsFromCatagory() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return data;
  }
}
