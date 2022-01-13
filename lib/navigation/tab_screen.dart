import 'package:birthday_flutter/screens/add_birthday_screen.dart';
import 'package:birthday_flutter/screens/error_screen.dart';
import 'package:birthday_flutter/screens/birthday_list_screen.dart';
import 'package:birthday_flutter/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/Tab";

  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {"page": BirthdayListScreen(), "title": "Birthday List"},
    {"page": AddBirthdayScreen(), "title": "Add Birthday"},
    {"page": SettingsScreen(), "title": "Settings"},
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedIndex]['title'] as String)),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Today',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Add',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
