import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherMapWidget extends StatefulWidget {
  @override
  _WeatherMapWidgetState createState() => _WeatherMapWidgetState();
}

class _WeatherMapWidgetState extends State<WeatherMapWidget> {
  String apiKey = '552ea31084a4a82bf8ce26477f4dc33c';
  double latitude = 6.927079; 
  double longitude = 79.861244; 
  String cityName = 'Colombo';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        latitude = data['coord']['lat'];
        longitude = data['coord']['lon'];
      });
    } else {
      print('Failed to fetch weather data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Map'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.1, 
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 13.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId('weatherMarker'),
              position: LatLng(latitude, longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
          },
        ),
      ),
    );
  }
}


