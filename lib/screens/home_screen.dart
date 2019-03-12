import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/list_screen.dart';
import 'package:flutter_workshop/screens/todos_screen.dart';

class HomeScreen extends StatefulWidget{

  final String name;

  HomeScreen({
    this.name
  });

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
        title: Text("Todo")
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
    Container(
      child: TodosScreen(),
    ),
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
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouritesScreen()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.name),
              accountEmail: Text("shivam.vk529@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(widget.name[0]),
              ),
            )
          ],
        ),
      ),
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