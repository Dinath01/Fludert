import 'dart:convert';
import 'package:fludert/pages/edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  final String apiKey = '552ea31084a4a82bf8ce26477f4dc33c';

  int temperature = 0;
  int maxTemp = 0;
  String weatherStateName = 'Loading..';
  int humidity = 0;
  int windSpeed = 0;
  double rainfall = 0.0;
  String rainfallSeverity = 'Loading..';

  var currentDate = 'Loading..';
  String imageUrl = '';
  String location = 'Colombo';

  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      setState(() {
        location = 'Permission denied';
        isLoading = false;
      });
    } else if (permission == LocationPermission.deniedForever) {
      setState(() {
        location = 'Permission permanently denied';
        isLoading = false;
      });
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      await _fetchWeatherData(position.latitude, position.longitude);
    }
  }

  Future<void> _fetchWeatherData(double latitude, double longitude) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(() {
        location = result['name'];
        temperature = result['main']['temp'].round();
        weatherStateName = result['weather'][0]['main'];
        humidity = result['main']['humidity'];
        windSpeed = result['wind']['speed'].round();
        maxTemp = result['main']['temp_max'].round();
        rainfall =
            result.containsKey('rain') ? result['rain']['1h'] ?? 0.0 : 0.0;

        var timestamp = result['dt'];
        var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
        currentDate = DateFormat('EEEE, d MMMM').format(dateTime);

        imageUrl = _getWeatherImageUrl(weatherStateName);

        if (rainfall >= 5.0) {
          rainfallSeverity = 'Severe';
        } else if (rainfall >= 3.0) {
          rainfallSeverity = 'Mid';
        } else {
          rainfallSeverity = 'Light';
        }

        isLoading = false;
      });
    } else {
      setState(() {
        location = 'Failed to fetch location data';
        isLoading = false;
      });
    }
  }

  String _getWeatherImageUrl(String weatherState) {
    switch (weatherState) {
      case 'Clear':
        return 'assets/images/clear.png';
      case 'Clouds':
        return 'assets/images/clouds.png';
      case 'Rain':
        return 'assets/images/rain.png';
      case 'Snow':
        return 'assets/images/snow.png';
      default:
        return 'assets/images/default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Image.asset(
        'assets/images/hpbg.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
      SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditAccountScreen()),
                        );
                      },
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
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
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Jura',
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 44, 44, 44),
                      shadows: [Shadow(blurRadius:9.0, color: Color.fromARGB(255, 49, 117, 212).withOpacity(1), offset: Offset(1.0, 1.0),)]
                      ),
                ),
                Text(
                  "Trevin Joseph",
                  style: TextStyle(fontSize: 35, fontFamily: "Humane"),
                ),
                Row(
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontFamily: 'Jura',
                      ),
                    ),
                    Text(
                      ', ',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'Jura',
                      ),
                    ),
                    Text(
                      currentDate,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'Jura',
                      ),
                    ),
                  ],
                ),
                isLoading ? _buildShimmerLoading() : _buildWeatherInfo(size),
              ],
            ),
          ),
        ]),
      ))
    ]));
  }

  Widget _buildShimmerLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerText(150),
        const SizedBox(height: 5),
        _buildShimmerText(100),
        const SizedBox(height: 20),
        _buildShimmerWeatherInfo(),
      ],
    );
  }

  Widget _buildShimmerText(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: 20,
        color: Colors.white,
      ),
    );
  }

  Widget _buildShimmerWeatherInfo() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(Size size) {
    return Container(
      width: size.width,
      height: 250, 
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              '$temperature°C',
              style: const TextStyle(
                fontSize: 40,
                fontFamily: "Jura",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: Image.asset(
              imageUrl,
              width: 130,
              height: 130,
            ),
          ),
          Positioned(
            top: 180,
            left: 30,
            child: Text(
              weatherStateName,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "Jura",
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humidity: $humidity%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Jura",
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Wind Speed: $windSpeed km/h',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Jura",
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Flood Severity: $rainfallSeverity',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Jura",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 115,
              right: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Light.png',
                    width: 90,
                    height: 90,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
