import 'package:flutter/material.dart';

class FullTask {
  final String title;
  final String task;

  const FullTask({required this.title, required this.task});
}

class TaskTile extends StatelessWidget {
  
  final FullTask taskInfo;

  const TaskTile({super.key, required this.taskInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          taskInfo.title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(
          taskInfo.task,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class Todo extends StatelessWidget {
  Todo({super.key});

  static const Color blackOne = Color(0xff1e1e20);

  final List<FullTask> allTasks = [
    FullTask(
      title: 'Create Project',
      task: 'It is about ceatign a small app about task list',
    ),
    FullTask(title: 'Buy grocery', task: 'Have to buy milk and Tofu'),
    FullTask(title: 'Meeting', task: 'Have to attend meeting this evening'),
    FullTask(
      title: 'Listen to podcast',
      task: 'listen to the podcast i have put in my like list',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackOne,
      appBar: AppBar(
        title: Text("My Tasks"),
        backgroundColor: blackOne,
        foregroundColor: Color(0xfffaf9fc),
      ),
      body: ListView.builder(
        itemCount: allTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(15.0),
            color: Color(0xff2e3032),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.check_box_outline_blank, size: 24,color: Colors.blueGrey,),
                SizedBox(width: 10,),
                Expanded(
                  child: TaskTile(taskInfo: allTasks[index]),
                ),
                Icon(Icons.delete, size: 24,color: Colors.blueGrey,),
              ],
            ),
          );
        },
      ),
    );
  }
}
