import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class ToDoDatabase {
  final _myBox = Hive.box('myBox');
  List toDoList = [];
  void createInitialData() {
    toDoList = [
      ['task1', false],
      ['task2', false],
      ['task3', false],
    ];
  }

  void loadData()
  {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateData(){
    _myBox.put('TODOLIST', toDoList);
  }
}
