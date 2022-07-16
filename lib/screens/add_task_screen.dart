import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {

   late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //diving the height of the bottom sheet container into two
      height: MediaQuery.of(context).size.height / 2,
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              //enables the keyboard right away
              autocorrect: true,
              //makes cursor show in the middle
              textAlign: TextAlign.center,
              decoration: const InputDecoration(),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              child: const Text(
                "Add",
                style: TextStyle(fontSize: 30.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen:false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
