import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tablet/Data/Pills.dart';

import 'models/Notify.dart';
import 'models/User.dart';
import 'models/gender.dart';
import 'models/todo.dart';

class HiveData {
  User userDetails = User(
      name: "tharani",
      age: 19,
      gender: Gender.Male,
      phno: "9787874607",
      dob: DateTime(2004, 5, 30));
  void Insert(Box box) {}
  List<Pills>? GetPillsList() {
    List<Pills> x = [];

    return x;
  }

  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    await getHiveBox('Todo').then((todoBox) async {
      var keys = todoBox.keys.toList();
      for (int x in keys) {
        todoList.add(todoBox.get(x));
      }
    });

    return todoList;
  }

  void deleteTodo(int key) async {
    Box todoBox = await Hive.openBox('Todo');
    //await todoBox.clear();
    await todoBox.delete(key);
    await todoBox.close();
  }

  Future<Box> getHiveBox(String boxName) async {
    return await Hive.openBox(boxName).then((box) => box);
  }

  int getHealthScore() {
    int healthScore = 0;
    return healthScore;
  }

  Future<void> clearAll(String box) async {
    Get.showSnackbar(GetSnackBar(
      dismissDirection: DismissDirection.horizontal,
      icon: Icon(Icons.warning_amber_rounded),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
      messageText: Text(
        "deleting....",
        style: GoogleFonts.lexend(color: Colors.black),
      ),
    ));
    Box clearBox = await Hive.openBox(box);
    await clearBox.clear();
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.greenAccent,
      duration: Duration(seconds: 3),
      messageText: Text(
        "deleted",
        style: GoogleFonts.lexend(color: Colors.black),
      ),
    ));
  }

  Future<User> getUser() async {
    User user;
    Box userBox = await Hive.openBox('User');
    try {
      user = userBox.getAt(0);
    } catch (e) {
      user = userDetails;
    }
    return user;
  }

  Future<void> addTodo(Todo todo) async {
    print('start adding todo to hive');
    Box todoBox = await Hive.openBox('Todo');
    if (!todoBox.isEmpty) {
      todo.key = todoBox.keys.toList()[todoBox.keys.length - 1] + 1;
      todoBox.add(todo);
    } else {
      var keys = todoBox.keys.toList();
      if (keys.isEmpty)
        todo.key = 0;
      else {
        todo.key = keys[keys.length - 1] + 1;
      }
      todoBox.add(todo);
    }
    print('finished adding todo to hive');
  }

  Future<void> addUser(User user) async {
    await Hive.openBox('User').then((box) async {
      await box.clear();
    });
    Box _userBox = await Hive.openBox('User');
    await _userBox.add(user);
  }

  Future<bool> boxIsEmpty(String box) async {
    Box boxDynamic = await Hive.openBox(box);
    if (boxDynamic.isEmpty) return true;
    return false;
  }
}
