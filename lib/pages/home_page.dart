import 'dart:math';
import 'package:fludert/assets/navbar.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location),
        actions: [
          DropdownButton<String>(
            value: location,
            onChanged: _changeLocation,
            items: cities
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body : Navbar(
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
                            Image.asset('assets/images/clear.png',width: 100,height: 100,),
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
                            Image.asset('assets/images/lightcloud.png',width: 50,height: 50,),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '60%',
                              style: TextStyle(fontSize: 16),
                            ),
                            Image.asset('assets/images/humidity.png',width: 50,height: 50,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: consolidatedWeatherList.length,
                itemBuilder: (context, index) {
                  var weather = consolidatedWeatherList[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('EEE').format(DateTime.parse(
                              weather['applicable_date'])).toUpperCase(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${weather['the_temp'].round()}°',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          weather['weather_state_name'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
      ),
      //bottomNavigationBar: Navbar(),
    );
  }
}