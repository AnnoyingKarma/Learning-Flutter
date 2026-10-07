import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokeFetch extends StatefulWidget {
  const JokeFetch({super.key});

  @override
  State<JokeFetch> createState() => _JokeFetchState();
}

class _JokeFetchState extends State<JokeFetch> {

  String joke = "";
  String punchLine = "";

  void fetchJoke()async{
    // var getApiData = http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    // or we can write like this too
    var uri = Uri.parse("https://official-joke-api.appspot.com/random_joke");
    var response = await http.get(uri);
    var responseBody = jsonDecode(response.body);
    setState(() {
      joke = responseBody["setup"];
      punchLine = responseBody["punchline"];
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    fetchJoke();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3368A0),
      appBar: AppBar(
        backgroundColor: Color(0xff66A3BF),
        title: Center(child: Text("Just Jokes",style: TextStyle(
          color: Color(0xffC8DFDB)
        ),)),
      ),
      body:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(joke, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color(0xffC8DFDB),
                  fontSize: 22,
                ),),
                SizedBox(height: 30,),
                Text(punchLine, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Color(0xffF2EFE7),
                  fontSize: 18,
                ),),
                SizedBox(height: 60,),
                ElevatedButton(onPressed: (){
                  fetchJoke();
                }, 
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0XFF66A3BF)),
                  foregroundColor: WidgetStatePropertyAll(Color(0XFFC8DFDB)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                ),
                child: Text("Next Joke"))
              ],
            ),
          ),
        ),
    );
  }
}