import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController=TextEditingController();
  String showStoredText="";
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              controller: myController,
            ),
          ),
          ElevatedButton(onPressed: ()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('value', myController.text);
            myController.clear();
          }, child: Text("Save")),
          ElevatedButton(onPressed: ()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String? storedText = prefs.getString("value");
            setState(() {
              showStoredText = storedText ?? "Nothing found";
            });
          }, child: Text("Load")),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(showStoredText,style: TextStyle(fontSize: 20,)),
          )
        ],
      ),
      
    );
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }
}