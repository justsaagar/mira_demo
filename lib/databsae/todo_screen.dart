import 'package:demo_1/databsae/db_helper.dart';
import 'package:demo_1/databsae/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          DateTime? picked = await showDatePicker(
            context: context,
            firstDate: DateTime(DateTime.now().year - 100, 1),
            lastDate: DateTime.now().subtract(const Duration(days: 1)),
            initialDate:DateTime.now().subtract(const Duration(days: 6575)),
            helpText: 'Date',
            confirmText: 'okay',
            cancelText: 'cancel',
            builder: (context, child) {
              return Theme(
                data: ThemeData(
                  dialogBackgroundColor: Colors.white,
                  colorScheme: const ColorScheme.light(
                    primary: Colors.blue,
                    onSurface: Colors.black,
                  ),
                  dialogTheme: DialogTheme(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 2,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked != null) {
            print("Let's check picked-> $picked");
            final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm:ss a');
            String formatted = formatter.format(picked);
            print("Let's check formatted-> $formatted");
          }
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
