import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const Color offWhite = Color(0xffF3E4C9);
const Color offGreen = Color(0xffBABF94);
const Color lightBrown = Color(0xffBFA28C);
const Color brown = Color(0xffA98B76);

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  String error = "";
  // Place -> (`-`)
  // Place Japan -> (`o`)
  var cityName = 'Saitama';

  String condition = "";

  String location = "";
  String region = "";
  String country = "";
  double temperatureInC = 0;
  double temperatureInF = 0;
  double windKph = 0;
  double windMph = 0;
  final myController = TextEditingController();

  void fetchWeather() async {
    var uri = Uri.https('api.weatherapi.com', '/v1/current.json', {
      'key': dotenv.env['WEATHER_API_KEY'],
      'q': cityName,
      'aqi': 'no',
    });
    var response = await http.get(uri);
    if (response.statusCode != 200) {
      setState(() {
        error = "!! There was an ERROR !!";
      });
    } else {
      error = "";
      var responseBody = jsonDecode(response.body);

      setState(() {
        condition = responseBody['current']['condition']['text'];
        location = responseBody['location']['name'];
        region = responseBody['location']['region'];
        country = responseBody['location']['country'];
        temperatureInC = responseBody['current']['temp_c'];
        temperatureInF = responseBody['current']['temp_f'];
        windKph = responseBody['current']['wind_kph'];
        windMph = responseBody['current']['wind_mph'];
      });
    }
  }

  @override
  void initState() {
    fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff869e88),
      backgroundColor: offWhite,

      appBar: AppBar(
        title: Text(
          "Weatherr",
          style: TextStyle(
            color: brown,
            fontSize: 50,
            fontWeight: FontWeight(600),
          ),
        ),
        backgroundColor: offGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter Location",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(offGreen),
                    foregroundColor: WidgetStatePropertyAll(brown),
                  ),
                  onPressed: () {
                    cityName = myController.text;
                    fetchWeather();
                  },
                  child: Text("Get"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightBrown,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Location : $location",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text("Region : $region", style: TextStyle(fontSize: 30)),
                    Text("Country : $country", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightBrown,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Text(condition, style: TextStyle(fontSize: 30)),
                    Text("$temperatureInC °C", style: TextStyle(fontSize: 30)),
                    Text("$temperatureInF °F", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightBrown,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    Text("Wind", style: TextStyle(fontSize: 30)),
                    Text("$windKph Kph", style: TextStyle(fontSize: 30)),
                    Text("$windMph Mph", style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
