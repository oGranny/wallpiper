import 'package:flutter/material.dart';
import 'package:wallpiper/pages/mainPage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
// import 'pages/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainWidget(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: MainWidget(),
          );
        });
  }
}
