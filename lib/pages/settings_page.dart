import 'package:fludert/pages/edit_screen.dart';
import 'package:fludert/assets/forward_button.dart';
import 'package:fludert/assets/setting_item.dart';
import 'package:fludert/assets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
      ),
      body:Stack(children: <Widget>[
          Image.asset(
            'assets/images/settings.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Jura",
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Jura",
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/images/avatar.png", width: 70, height: 70),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trevin Joseph",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: "Jura",
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "Jura",
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      ForwardButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditAccountScreen(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Jura"
                  ),
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Language",
                  icon: Ionicons.earth,
                  bgColor: Colors.orange.shade100,
                  iconColor: Colors.orange,
                  value: "English",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Notifications",
                  icon: Ionicons.notifications,
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SettingSwitch(
                  title: "Dark Mode",
                  icon: Ionicons.earth,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  value: isDarkMode,
                  onTap: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Help",
                  icon: Ionicons.nuclear,
                  bgColor: Colors.red.shade100,
                  iconColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

