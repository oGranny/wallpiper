import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:wallpiper/pages/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpiper',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: CustomSplash(
        imagePath: 'assets/wallpiper.png',
        backGroundColor: Colors.white,
        animationEffect: 'zoom-out',
        logoSize: 200,
        home: MainWidget(),
        // customFunction: fetchApi_(),
        duration: 2000,
        type: CustomSplashType.StaticDuration,
        // outputAndHome: op,
      ),
    );
  }
}

// runApp(MaterialApp(
//     home: CustomSplash(
//         imagePath: 'assets/flutter_icon.png',
//         backGroundColor: Colors.deepOrange,
//         animationEffect: 'zoom-in',
//         logoSize: 200,
//         home: MyApp(),
//         customFunction: duringSplash,
//         duration: 2500,
//         type: CustomSplashType.StaticDuration,
//         outputAndHome: op,
//     ),
// ));
