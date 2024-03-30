import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String name = 'John Dew';
  String phone = '0772211005';
  String address = 'Gampola Kandy';
  String email = 'joindew@hotmail.com';

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 20),
            buildProfileItem(
              'Name',
              isEditing ? TextFormField(controller: nameController) : Text(name),
              CupertinoIcons.person,
            ),
            const SizedBox(height: 10),
            buildProfileItem(
              'Phone',
              isEditing ? TextFormField(controller: phoneController) : Text(phone),
              CupertinoIcons.phone,
            ),
            const SizedBox(height: 10),
            buildProfileItem(
              'Address',
              isEditing ? TextFormField(controller: addressController) : Text(address),
              CupertinoIcons.location,
            ),
            const SizedBox(height: 10),
            buildProfileItem(
              'Email',
              isEditing ? TextFormField(controller: emailController) : Text(email),
              CupertinoIcons.mail,
            ),
          ],
        ),
      ),
      floatingActionButton: isEditing
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  phone = phoneController.text;
                  address = addressController.text;
                  email = emailController.text;
                  isEditing = false;
                });
              },
              child: Icon(Icons.check),
            )
          : null,
    );
  }

  Widget buildProfileItem(String title, Widget content, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.purple.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: content,
        leading: Icon(iconData),
        trailing: isEditing ? null : Icon(Icons.arrow_forward, color: Colors.grey),
        tileColor: Colors.white,
      ),
    );
  }
}
