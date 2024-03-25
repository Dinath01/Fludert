import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

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
  late String location;
  final String apiKey = '552ea31084a4a82bf8ce26477f4dc33c';
  Map<String, dynamic> weatherData = {};
  double? rainfall = 0.0;
  String weatherSeverityLevel = '';

  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  final TextEditingController _locationController = TextEditingController();

  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    location = 'Colombo'; //default
    fetchWeather();
    _controller = VideoPlayerController.asset('assets/images/Waves.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      looping: true,
      autoPlay: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: false,
      showControls: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }


  Future<void> fetchWeather() async {
    try {
      final data = await fetchWeatherData(location, apiKey);
      final rainData = await fetchWeatherData(location, apiKey);
      setState(() {
        weatherData = data;
        rainfall = rainData['rain']['1h'];
        if (rainfall != null) {
          if (rainfall! > 4.00) {
            weatherSeverityLevel = "Severe";
          } else if (rainfall! > 2.00) {
            weatherSeverityLevel = 'Mid';
          } else {
            weatherSeverityLevel = 'Safe';
          }
        }
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  Future<Map<String, dynamic>> fetchWeatherData(
      String city, String apiKey) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Chewie(controller: _chewieController),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/menu.png',
                          height: 45,
                          color: Colors.grey[800],
                        ),
                        Icon(
                          Icons.person,
                          size: 45,
                          color: Colors.grey[800],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                        ),
                        Text(
                          'Trevin Joseph',
                          style: GoogleFonts.bebasNeue(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        labelText: 'Enter Location',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              location = _locationController.text;
                              fetchWeather();
                            });
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  if (weatherData.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WeatherCard(
                        temperature: weatherData['main']['temp'],
                        weatherCondition: weatherData['weather'][0]['main'],
                        windSpeed: weatherData['wind']['speed'],
                      ),
                    ),
                  if (rainfall != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WeatherSeverityCard(
                        rainfall: rainfall!,
                        weatherSeverityLevel: weatherSeverityLevel,
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final double temperature;
  final String weatherCondition;
  final double windSpeed;

  const WeatherCard({
    required this.temperature,
    required this.weatherCondition,
    required this.windSpeed,
    Key? key,
  }) : super(key: key);

  String getIconForWeatherCondition(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return 'assets/images/clear.png';
      case 'clouds':
        return 'assets/images/lightcloud.png';
      case 'rain':
        return 'assets/images/heavyrain.png';
      case 'snow':
        return 'assets/images/snow.png';
      default:
        return 'assets/images/max-temp.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Temperature: $temperature °C',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  getIconForWeatherCondition(weatherCondition),
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 8),
                Text(
                  'Weather: $weatherCondition',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Wind Speed: $windSpeed m/s',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherSeverityCard extends StatelessWidget {
  final double rainfall;
  final String weatherSeverityLevel;

  const WeatherSeverityCard({
    required this.rainfall,
    required this.weatherSeverityLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rainfall: $rainfall mm',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Weather Severity Level: $weatherSeverityLevel',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
