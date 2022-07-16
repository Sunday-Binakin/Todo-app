
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';



class TaskData extends ChangeNotifier {
  final List <Task> _tasks = [
    Task(name: "Providers"),
    Task(name: "Ecommerce"),
    Task(name: "UI gyming"),
  ];

// List<Task> get  tasks{
//   return _tasks;
// }
UnmodifiableListView<Task> get tasks{
  return UnmodifiableListView(_tasks);
}

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task  = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  // to checkbox of the list of items
  void  updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  // delete method
  deleteTask(Task task){
   _tasks.remove(task); 
   notifyListeners();
  }
}