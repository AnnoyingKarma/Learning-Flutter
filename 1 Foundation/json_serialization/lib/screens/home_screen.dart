import 'package:flutter/material.dart';
import 'package:json_serialization/models/dummy_class.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String jsonText = "";
  Player ?restorePlayer;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lime,
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightGreen)),onPressed: (){
                  Player playerOne = Player(name: "Creek", life: 3);
                  setState(() {
                    jsonText = jsonEncode(playerOne.toMap());
                    
                  });
                }, child: Text("Translate to Text")),
                Text(jsonText),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightGreen)),onPressed: (){
                  Map<String, dynamic> decodeMap = jsonDecode(jsonText);
                  setState(() {
                    restorePlayer = Player.fromMap(decodeMap);
                    
                  });
                }, child:Text("Translate to Class")),
                Text(restorePlayer.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}