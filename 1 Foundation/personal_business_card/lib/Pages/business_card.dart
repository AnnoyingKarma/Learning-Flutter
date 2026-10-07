import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Business Card")),),
      body: Container(
        color: Colors.white10,
        child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Reigen\nArataka',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/Reigen Arataka.jpg"),
                      radius: 90,
                    ),
                  ),
                ),
              ]
            ),
            Card(
              child: Row(children: [
                  Icon(Icons.phone),
                  Text("Phone Number : +91-971727721"),
              ],),
            ),
            Card(
              child: Row(children: [
                Icon(Icons.email),
                Text("E-Mail : xyz@gmail.com"),
              ],
              ),
            )
            

          ],
        ),
      ),
    );
  }
}
