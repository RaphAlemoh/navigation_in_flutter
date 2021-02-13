import 'package:flutter/material.dart';
import 'gratitude.dart';
import 'reminders.dart';
import 'birthdays.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;


      @override
      void initState() {
      super.initState();
      _listPages
      ..add(Birthdays())
      ..add(Gratitude())
      ..add(Reminders());
      _currentPage = Birthdays();
      }


    void _changePage(int selectedIndex) {
      setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
      });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Flutter Bottom Navigation Bar'),
        ),
        body: SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentPage,
          ),
        ),

      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.cake),
          // ignore: deprecated_member_use
          title: Text('Birthdays'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.sentiment_satisfied),
          // ignore: deprecated_member_use
          title: Text('Gratitude'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm),
          // ignore: deprecated_member_use
          title: Text('Reminders'),
      ),
      ],
      onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
      );
  }

}