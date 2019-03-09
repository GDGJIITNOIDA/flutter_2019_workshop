import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/list_screen.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.assignment),
        title: Text("List")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.movie),
        title: Text("Movies")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text("Profile")
    )
  ];

  List<Widget> _children = [
    Container(
      child: ListScreen(),
    ),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DSC Workshop",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _children[_currentIndex],

    );
  }

}