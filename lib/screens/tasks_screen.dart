import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent, 
        floatingActionButton:  FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(Icons.add),
            onPressed: ()=> showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => AddTaskScreen(
                     // (newTaskTitle){}
                    ),
                  )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 30, right: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
                  const CircleAvatar(
                    child: Icon(Icons.list_rounded,
                        size: 30, color: Colors.lightBlueAccent),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text("Todoey",
                      style: const TextStyle(color: Colors.white, fontSize: 50)),
                  Text(
                    "${Provider.of<TaskData>(context, listen:false).tasks.length} Tasks",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: const TasksList(),
              ),
            )
          ],
        ));
  }
}
