import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {

  int rollDice(){
    int diceNum = Random().nextInt(6)+1;
    return diceNum;
  }
  int ranNum = 1;
  String diceString(int num){
    switch (num) {
      case 1:
        return "assets/tile001.png";
        break;
      case 2:
        return "assets/tile002.png";
        break;
      case 3:
        return "assets/tile003.png";
        break;
      case 4:
        return "assets/tile004.png";
        break;
      case 5:
        return "assets/tile005.png";
        break;
      case 6: 
        return "assets/tile006.png";
        break;
    }
    String diceImage = "";
    return diceImage;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Random Dice Roller",
          style: TextStyle(fontWeight: FontWeight(900)),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              ranNum = rollDice();
            });
          }, child: Text("Roll The Dice")),
          Text(ranNum.toString()),
          Image.asset(diceString(ranNum)),
        ],
      ),
    );
  }
}
