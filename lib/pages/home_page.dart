import 'dart:math';
import 'dart:ui';
import 'package:fludert/assets/navbar.dart';
import 'package:fludert/assets/weather_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fludert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = 'Colombo';
  List<String> cities = ['Colombo', 'Matara', 'Jaffna'];
  List<dynamic> consolidatedWeatherList = List.generate(
    7,
    (index) => {
      'id': Random().nextInt(1000),
      'weather_state_name': 'Sunny',
      'wind_speed': Random().nextInt(10) + 1,
      'applicable_date': DateTime.now().add(Duration(days: index)).toString(),
      'the_temp': Random().nextInt(30) + 15,
    },
  );

  void _changeLocation(String? newLocation) {
    if (newLocation != null) {
      setState(() {
        location = newLocation;
        consolidatedWeatherList = List.generate(
          7,
          (index) => {
            'id': Random().nextInt(1000),
            'weather_state_name': 'Sunny',
            'wind_speed': Random().nextInt(10) + 1,
            'applicable_date':
                DateTime.now().add(Duration(days: index)).toString(),
            'the_temp': Random().nextInt(30) + 15,
          },
        );
      });
    }
  }

  String floodSeverity = 'Severe'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location),
        actions: [
          DropdownButton<String>(
            value: location,
            onChanged: _changeLocation,
            items: cities.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      // body : Navbar(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    location,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    DateTime.now().toString().substring(0, 10),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '25°',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              'Feels like 22°',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/clear.png',
                              width: 100,
                              height: 100,
                            ),
                            Text(
                              'Sunny',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '10km/h',
                              style: TextStyle(fontSize: 16),
                            ),
                            Image.asset(
                              'assets/images/lightcloud.png',
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '60%',
                              style: TextStyle(fontSize: 16),
                            ),
                            Image.asset(
                              'assets/images/humidity.png',
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FloodSeverityCard(severityLevel: floodSeverity),
                  

                ],
              ),
            ),
            
            //WeatherMapWidget()
          ],
        ),
      ),
      // ),
      //bottomNavigationBar: Navbar(),
    );
  }
}

class FloodSeverityCard extends StatelessWidget {
  final String severityLevel;

  const FloodSeverityCard({Key? key, required this.severityLevel})
    : super(key: key); 

    Color _getColorForSeverity(String severityLevel) {
    switch (severityLevel.toLowerCase()) {
      case 'severe':
        return Colors.red;
      case 'mid':
        return Colors.orange;
      case 'safe':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }  

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _getColorForSeverity(severityLevel);
        String assetName = '';
    
    switch (severityLevel.toLowerCase()) {
      case 'severe':
        assetName = 'assets/images/Severe.png';
        break;
      case 'mid':
        assetName = 'assets/images/Mid.png';
        break;
      case 'safe':
        assetName = 'assets/images/Light.png';
        break;
      default:
        assetName = '';
        break;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white70.withOpacity(1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0,3),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor.withOpacity(0.8),
            backgroundColor.withOpacity(1),
          ]
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(
          "Flood Severity",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          textAlign: TextAlign.center,
        ),
          SizedBox(height: 10),
          Text(
            'Severity Level: $severityLevel',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          // Add relevant image based on severity level
          if (assetName.isNotEmpty)
            Center(
              child: Image.asset(
                assetName,
                width: 60,
                height: 60,
              ),
            ),
        ],
      ),
    );
  }
}

