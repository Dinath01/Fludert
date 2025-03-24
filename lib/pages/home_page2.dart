import 'dart:convert';
import 'dart:ui';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  List<FloodInstance> pastFloodInstances =
      []; // Dummy data for past flood instances

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _getCurrentLocation();
    _loadPastFloodInstances(); // Load dummy data for past flood instances
  }

  Future<void> _initializeNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification(String title, String body) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
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
          _showNotification('Severe Rainfall',
              'Severe rainfall is expected. Be prepared for a Flood Occurrence');
        } else if (rainfall >= 3.0) {
          rainfallSeverity = 'Mid';
          _showNotification(
              'Moderate Rainfall', 'Moderate rainfall is expected. Be Aware');
        } else {
          rainfallSeverity = 'Light';
          _showNotification('Light Rainfall', 'Light rainfall is expected.');
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

  Future<void> _loadPastFloodInstances() async {

    setState(() {
      pastFloodInstances = [
        FloodInstance(
          date: '2023-05-15',
          severity: 'Severe',
          location: 'Matara',
          description: 'The whole proportion of Matara and Hakmana area was mostly forced by flood, Where people suffered indeffinitely for like a month period of time',
        ),
        FloodInstance(
          date: '2023-08-20',
          severity: 'Mid',
          location: 'Rathnapura',
          description: 'The whole area was forced by flood where the destruction caused was risen to the point where electricity was cut off for a long period of time to ensure peoples safety.',
        ),
        FloodInstance(
          date: '2023-11-10',
          severity: 'Light',
          location: 'Aheliyagoda',
          description: 'The whole area was forced by flood where the destruction caused was risen to the point where electricity was cut off for a long period of time to ensure peoples safety.',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Positioned(
        width: MediaQuery.of(context).size.width * 1.7,
        left: 100,
        bottom: 100,
        child: Image.asset(
          "assets/images/Spline.png",
        ),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: const SizedBox(),
        ),
      ),
      const RiveAnimation.asset(
        "assets/images/shapes.riv",
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        ),
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
                      MaterialPageRoute(
                          builder: (context) => EditAccountScreen()),
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
                      shadows: [
                        Shadow(
                          blurRadius: 9.0,
                          color:
                              Color.fromARGB(255, 49, 117, 212).withOpacity(1),
                          offset: Offset(1.0, 1.0),
                        )
                      ]),
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
                const SizedBox(height: 20),
                _buildPastFloodInstances(),
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
    String weatherIcon;
    switch (rainfallSeverity) {
      case 'Severe':
        weatherIcon = 'assets/images/Severe.png';
        break;
      case 'Mid':
        weatherIcon = 'assets/images/Mid.png';
        break;
      case 'Light':
        weatherIcon = 'assets/images/Light.png';
        break;
      default:
        weatherIcon = 'assets/images/default.png';
    }

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
                    weatherIcon,
                    width: 90,
                    height: 90,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildPastFloodInstances() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Past Flood Instances',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Medium',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        isLoading ? _buildShimmerPastFloodList() : _buildPastFloodList(),
      ],
    );
  }

  Widget _buildShimmerPastFloodList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 80,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildPastFloodList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: pastFloodInstances.length,
      itemBuilder: (context, index) {
        final floodInstance = pastFloodInstances[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            elevation: 3,
            child: ListTile(
              title: Text(
                'Date: ${floodInstance.date}',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Jura'),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Severity: ${floodInstance.severity}',
                    style: TextStyle(fontFamily: 'Jura'),
                  ),
                  Text(
                    'Location: ${floodInstance.location}',
                    style: TextStyle(fontFamily: 'Jura'),
                  ),
                  Text(
                    'Description: ${floodInstance.description}',
                    style: TextStyle(fontFamily: 'Jura'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FloodInstance {
  final String date;
  final String severity;
  final String location;
  final String description;

  FloodInstance({
    required this.date,
    required this.severity,
    required this.location,
    required this.description,
  });
}

class EditAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account'),
      ),
      body: Center(
        child: Text('Edit Account Screen'),
      ),
    );
  }
}
