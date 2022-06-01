import 'package:flutter/material.dart';
import 'package:hotel_booking/app/functions.dart';
import 'package:hotel_booking/presentaion/resources/colors_manager.dart';

import 'pages/favourite/favourite_screen.dart';
import 'pages/home/views/home_screen.dart';
import 'pages/settings/views/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  List<Widget> pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        toolbarHeight: 0.0,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: currentIndex,
        backgroundColor: isLightTheme(context) ? Colors.white : Colors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          ),
        ],
      ),
    );
  }
}
