import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget{
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>{

  List<String> _list = [];

  @override
  Widget build(BuildContext context) {

    for(int i=0; i<100; i++){
      _list.add("List item " + (i+1).toString());
    }

    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index){
          return _buildRow(_list, index);
      },
    );
  }

  Widget _buildRow(_list, index){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _list[index],
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}