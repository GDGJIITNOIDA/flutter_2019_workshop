import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/todos.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class TodosScreen extends StatefulWidget{
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen>{

  Future<List<Todos>> getTodosData() async{
    String url = "https://jsonplaceholder.typicode.com/todos";
    var data = await http.get(url);

    return TodosList.fromJson(json.decode(data.body)).todosList;

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTodosData(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Text(
                            snapshot.data[index].title
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}