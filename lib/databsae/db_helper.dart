import 'dart:async';
import 'dart:io';
import 'package:demo_1/databsae/todo_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database? _db;

  DBHelper._instance();

  static const String taskId = 'taskId';
  static const String categoryName = 'categoryName';
  static const String name = 'name';
  static const String time = 'time';
  static const String dateTime = 'dateTime';
  static const String description = 'description';
  static const String tableName = 'TodoTable';
  static const String dbName = 'todo_table';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    } else {
      print('Database Name : $_db');
      print('Database Check : ${_db!.isOpen}');
    }
    return _db;
  }

  _initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $tableName ($taskId integer primary key autoincrement, $categoryName TEXT, $name TEXT,$time TEXT,$dateTime TEXT,$description TEXT)');
  }

  Future<List<Map<String, dynamic>>> getAllUserMap() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query(tableName);
    print('Get all user map result : $result');
    return result;
  }

  Future<List<TodoModel>> getAllUserList() async {
    final List<Map<String, dynamic>> userMapList = await getAllUserMap();
    List<TodoModel> userList = [];
    for (var userMap in userMapList) {
      userList.add(TodoModel.fromJson(userMap));
    }
    userList.sort((userA, userB) => userA.taskId!.compareTo(userB.taskId ?? 0));
    print('Get all user list result : $userList');
    return userList;
  }

  Future<int> addUser(TodoModel userModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!.insert(tableName, userModel.toJson());
    print('Add user result : $result');
    return result;
  }

  Future<int> updateUser(TodoModel userModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!.update(tableName, userModel.toJson(), where: '$taskId = ?', whereArgs: [userModel.taskId]);
    print('Update user result : $result');
    return result;
  }

  Future<int> deleteUser(int id) async {
    Database? dbClient = await db;
    final int result = await dbClient!.delete(tableName, where: '$taskId = ?', whereArgs: [id]);
    print('Delete user result : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> searchUser(userName) async {
    Database? dbClient = await db;
    return await dbClient!.query(tableName, where: '$categoryName LIKE ?', whereArgs: [userName]);
  }
}
