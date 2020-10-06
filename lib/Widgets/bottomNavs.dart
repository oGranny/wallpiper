import 'package:flutter/material.dart';
// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:bmnav/bmnav.dart';
// import 'package:wallpiper/pages/Home.dart';
import 'package:wallpiper/pages/about.dart';
import 'package:wallpiper/pages/categories.dart';

BottomNav normalNavBar(BuildContext context) {
  // int currentTab = 0;
  // final List<Widget> pages = [
  //   Home(),
  //   About(),
  // ];
  // Widget currentScreen = Home();
  // PageStorageBucket bucket = PageStorageBucket();

  return BottomNav(
    // index: currentTab,
    // labelStyle: LabelStyle(visible: false),
    onTap: (i) {
      print("$i");
      switch (i) {
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => About()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Categories()));
          break;
        default:
      }
    },
    items: [
      BottomNavItem(Icons.home),
      BottomNavItem(Icons.category),
      BottomNavItem(Icons.history),
      BottomNavItem(Icons.view_headline)
    ],
  );
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNav(
      // index: currentTab,
      // labelStyle: LabelStyle(visible: false),
      onTap: (i) {
        print("$i");
        switch (i) {
          case 3:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About()));
            break;
          case 1:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Categories()));
            break;
          default:
        }
      },
      items: [
        BottomNavItem(Icons.home),
        BottomNavItem(Icons.category),
        BottomNavItem(Icons.history),
        BottomNavItem(Icons.view_headline),
      ],
    );
  }
}
