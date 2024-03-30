import 'dart:convert';
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

        var timestamp = result['dt'];
        var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
        currentDate = DateFormat('EEEE, d MMMM').format(dateTime);

        imageUrl = _getWeatherImageUrl(weatherStateName);
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
                  'Welcome!',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
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
                      ),
                    ),
                    Text(
                      ', ',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      currentDate,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                isLoading
                    ? _buildShimmerLoading() 
                    : _buildWeatherInfo(size), 
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
      height: 200,
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
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Image.asset(
              imageUrl,
              width: 70,
              height: 70,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              weatherStateName,
              style: const TextStyle(
                fontSize: 20,
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
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Wind Speed: $windSpeed km/h',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
