import 'package:flutter/material.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:wallpiper/Widgets/appBar.dart';
import 'package:wallpiper/data/data.dart';
import 'package:wallpiper/pages/about.dart';
import 'package:wallpiper/pages/categories.dart';
import 'package:wallpiper/pages/favourates.dart';
import 'Home.dart';

class MainWidget extends StatefulWidget {
  @override
  MainWidgetState createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    super.initState();
    fetchApi();
    fetchCateggory();
  }

  int currentTab = 0;
  final List<Widget> screens = [
    HomeBody(),
    CategoryB(),
    Favourates(),
    AboutBody(),
  ];
  Widget currentScreen = HomeBody();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,
      body: PageStorage(child: currentScreen, bucket: bucket),
      bottomNavigationBar: bmnav.BottomNav(
        index: currentTab,
        // color: currentTheme,
        labelStyle: bmnav.LabelStyle(visible: false),
        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = screens[i];
          });
        },
        items: [
          bmnav.BottomNavItem(Icons.home, label: 'Home'),
          bmnav.BottomNavItem(Icons.category, label: 'Workouts'),
          bmnav.BottomNavItem(Icons.favorite, label: 'Account'),
          bmnav.BottomNavItem(Icons.view_headline, label: 'Settings')
        ],
      ),
    );
  }
}
