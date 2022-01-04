import 'package:flutter/material.dart';

import '../Widgets/TaskList_Widget.dart';
import '../Widgets/AddTaskDialog.dart';
import '../Widgets/CompletedList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final tabs = [TaskList(), CompletedList()];

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
      // backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color(0xff1e00b7),
      unselectedItemColor: Color(0xff3c15e5),
      selectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: (selection) => setState(() {
        selectedIndex = selection;
      }),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined), label: 'Pending'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 28,
            ),
            label: 'Completed'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Todo : in build widget or not ?
    // final tabs = [ Container(), Container() ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e00b7),
        centerTitle: true,
        title: Text('NoteBookly'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AddTaskDialog(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}
