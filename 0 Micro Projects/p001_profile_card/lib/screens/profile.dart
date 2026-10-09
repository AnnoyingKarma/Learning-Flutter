import 'package:flutter/material.dart';

class StatItem  extends StatelessWidget {
  
  final String label;

  const StatItem ({super.key,
  required this.label,});


  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(padding:const EdgeInsets.all(8.0), child: Text(label,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),));
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/unknown.jpg"),
                ),
              ),
              Text(
                "Alex",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatItem(label: "Projects\nA real time chat app\nA delievery app"),
                    StatItem(label: "Followers\n10"),
                    StatItem(label: "Following\n5")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Android Developer",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Experience with multiple platforms using flutter (Windows,Web,Android,IOS)\nGood at solving dsa questions.\nCan learn new tech if needed.",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),textAlign: TextAlign.center,
              ),
              SizedBox(height: 24,),
              ElevatedButton(onPressed: null, child: Text("Close")),
            ],
          ),
        ),
      ),
    );
  }
}
