import 'package:demo_1/databsae/db_helper.dart';
import 'package:demo_1/databsae/todo_model.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await DBHelper.instance.addUser(
          //   TodoModel(
          //     taskId: DateTime.now().microsecondsSinceEpoch,
          //     categoryName: 'categoryName',
          //     dateTime: 'dateTime',
          //     description: 'description',
          //     name: 'name',
          //     time: 'time'
          //   ),
          // );
          // await DBHelper.instance.getAllUserMap();
          // await DBHelper.instance.deleteUser(1701944512615165);
          // await DBHelper.instance.getAllUserMap();
        },
      ),
    );
  }
}
