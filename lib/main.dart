import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String city = "";
  String temperature = "";
  String condition = "";

  void fetchWeatherData() {
    final List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    final Random random = Random();

    setState(() {
      city = _cityController.text;
      temperature = "${15 + random.nextInt(16)}°C";
      condition = conditions[random.nextInt(conditions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Info App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWeatherData,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $city', style: TextStyle(fontSize: 20)),
            Text('Temperature: $temperature', style: TextStyle(fontSize: 20)),
            Text('Condition: $condition', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
