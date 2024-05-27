import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/Widget/TodoCard.dart';

import '../Database/models/todo.dart';

class TodoList extends StatefulWidget {
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Box todoBox;
  bool isLoading = false;
  bool isBoxEmpty = false;
  void setup() async {
    setState(() {
      isLoading = true;
    });
    Box temp = await HiveData().getHiveBox('Todo');
    bool tempcheck = await HiveData().boxIsEmpty("Todo");
    setState(() {
      todoBox = temp;
      isBoxEmpty = tempcheck;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  Widget build(context) {
    if (isLoading) return Lottie.asset('assets/animations/loadtodo.json');
    if (isBoxEmpty) {
      return Lottie.asset('assets/animations/addtodo.json',
          height: MediaQuery.of(context).size.height * 0.20, repeat: true);
    }
    return ValueListenableBuilder(
      valueListenable: todoBox.listenable(),
      builder: (context, box, child) {
        var keyList = box.keys.toList();
        print(keyList);
        var todoList = [];
        for (int i = 0; i < keyList.length; i++)
          todoList.insert(keyList[i], todoBox.getAt(keyList[i]));
        return Column(
            children: [...todoList.map((e) => TodoCard(todo: e)).toList()]);
      },
    );
  }
}
