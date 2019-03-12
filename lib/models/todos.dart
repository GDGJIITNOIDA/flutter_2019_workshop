import 'package:flutter/material.dart';

class Todos{

  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todos({
    this.userId,
    this.id,
    this.title,
    this.completed
  });

  factory Todos.fromJson(Map<String, dynamic> parsedJson){
    return Todos(
      id: parsedJson['id'],
      userId: parsedJson['userId'],
      title: parsedJson['title'],
      completed: parsedJson['completed']
    );
  }

}

class TodosList{
  final List<Todos> todosList;

  TodosList({
    this.todosList
  });

  factory TodosList.fromJson(List<dynamic> parsedJson){

    List<Todos> todos = parsedJson.map((i) => Todos.fromJson(i)).toList();

    return TodosList(
      todosList: todos
    );

  }
}