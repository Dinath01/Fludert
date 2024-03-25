
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Force'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Our Mission: Empowering Communities\nTo Get Through Flood Disasters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'We created Fludert because we understand the devastating impact floods can have on communities. Lives are disrupted, homes are damaged, and precious belongings are lost. We believe everyone deserves to feel safe and prepared when facing flood risks.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'The Fludert app provides real-time flood alerts, empowering you to take proactive measures to protect yourself and your loved ones.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Meet the Flood Force Team:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTeamMemberCard(
                  context,
                  'assets/images/profile.png',
                  'Blah\nCityville\nTeam Leader',
                ),
                SizedBox(width: 20),
                _buildTeamMemberCard(
                  context,
                  'assets/images/profile.png',
                  'Blah\nTownville\nUI/UX Designer',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTeamMemberCard(
                  context,
                  'assets/images/profile.png',
                  'Blah\nSuburbia\nData Scientist',
                ),
                SizedBox(width: 20),
                _buildTeamMemberCard(
                  context,
                  'assets/images/profile.png',
                  'Blah\nMetropolis\nBackend Specialist',
                ),
              ],
            ),
          ],
        ),
      ),
    ),);
  }

  Widget _buildTeamMemberCard(BuildContext context, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(description),
            );
          },
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(imagePath,fit: BoxFit.cover),
        )
         // image: DecorationImage(
           // image: AssetImage(imagePath),
           // fit: BoxFit.cover,
          ),
        );
     // ),
    //);
  }
}
