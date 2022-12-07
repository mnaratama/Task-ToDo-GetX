import 'dart:convert';
import 'package:todogetx/app/core/utils/keys.dart';
import 'package:todogetx/app/data/models/task.dart';
import 'package:todogetx/app/data/services/storage/services.dart';
import 'package:get/get.dart';

class TaskProvider {
  StorageService _storage = Get.find<StorageService>();

  // {'tasks': [{
  //   'title': 'Work',
  //   'color': '#ff123456',
  //   'icon': 0xe123}
  // ]}

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}