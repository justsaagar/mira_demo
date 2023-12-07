import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  num? taskId;
  String? categoryName;
  String? name;
  String? time;
  String? dateTime;
  String? description;

  TodoModel({
    this.taskId,
    this.categoryName,
    this.name,
    this.time,
    this.dateTime,
    this.description,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        taskId: json["taskId"],
        categoryName: json["categoryName"],
        name: json["name"],
        time: json["time"],
        dateTime: json["dateTime"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "categoryName": categoryName,
        "name": name,
        "time": time,
        "dateTime": dateTime,
        "description": description,
      };
}
