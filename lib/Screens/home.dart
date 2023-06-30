import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/database.dart';
import 'package:to_do_list/shared/cards.dart';

import 'package:to_do_list/shared/DialogBox.dart';
import 'package:to_do_list/shared/help.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _myBox = Hive.box('myBox');
  ToDoDatabase td = ToDoDatabase();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      td.createInitialData();
    } else {
      td.loadData();
    }
    super.initState();
  }

  void onChanged(bool? value, int index) {
    setState(() {
      td.toDoList[index][1] = !td.toDoList[index][1];
    });
    td.updateData();
  }

  void onSave() {
    setState(() {
      td.toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    td.updateData();
  }

  deleteTask(int index) {
    setState(() {
      td.toDoList.removeAt(index);
    });
    td.updateData();
  }

  void newTask() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return DialogBox(
            controller: _controller,
            onSave: onSave,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: const Text(
            "TO-DO LIST",
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.0,
            ),
          ),
          backgroundColor: Colors.deepPurple[400],
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Help();
                      });
                },
                icon: Icon(Icons.help_outline))
          ],
        ),
        body: ListView.builder(
          itemCount: td.toDoList.length,
          itemBuilder: (context, index) {
            return CardsWidget(
              title: td.toDoList[index][0],
              checked: td.toDoList[index][1],
              onChanged: (value) => onChanged(value, index),
              deleteTask: (p0) => deleteTask(index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: newTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.purple[400],
        ));
  }
}
