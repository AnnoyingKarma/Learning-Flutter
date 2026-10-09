import 'package:flutter/material.dart';

class Task {
  final String title;
  final String task;
  bool done = false;

  Task({required this.title, required this.task});
}

class TaskTile extends StatelessWidget {
  final Task taskInfo;

  const TaskTile({super.key, required this.taskInfo});

  @override
  Widget build(BuildContext context) {

    final textColor = taskInfo.done ? Colors.white54 : Colors.white;
    final decoration = taskInfo.done ? TextDecoration.lineThrough : TextDecoration.none;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          taskInfo.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColor,
            decoration: decoration,
            decorationThickness: 3,
          ),
        ),
        Text(
          taskInfo.task,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: textColor,
            decoration: decoration,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  static const Color blackOne = Color(0xff1e1e20);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<Task> allTasks = [
    Task(
      title: 'Create Project',
      task: 'It is about ceatign a small app about task list',
    ),
    Task(title: 'Buy grocery', task: 'Have to buy milk and Tofu'),
    Task(title: 'Meeting', task: 'Have to attend meeting this evening'),
    Task(
      title: 'Listen to podcast',
      task: 'listen to the podcast i have put in my like list',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Todo.blackOne,
      appBar: AppBar(
        title: Text("My Tasks"),
        backgroundColor: Todo.blackOne,
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
                Checkbox(
                  value: allTasks[index].done,
                  fillColor: WidgetStatePropertyAll(Colors.blueGrey),
                  onChanged: (bool? value) {
                    setState(() {
                      allTasks[index].done = value ?? false;
                    });
                  },
                ),
                SizedBox(width: 10),
                Expanded(child: TaskTile(taskInfo: allTasks[index])),
                IconButton(
                  onPressed: () {
                    final task=allTasks[index];
                    setState(() {
                      allTasks.remove(task);
                    });
                  },
                  icon: Icon(Icons.delete, size: 24, color: Colors.blueGrey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
