import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpiper/pages/Home.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Center(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => Home()),
          );
        },
        child: RichText(
          text: TextSpan(
              text: "Wall",
              style: TextStyle(
                // fontFamily: 'serif',
                color: Colors.black87,
                fontSize: kIsWeb ? 25 : 20,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "Piper",
                    style: TextStyle(
                      // fontFamily: 'serif',
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                      fontSize: kIsWeb ? 25 : 20,
                    ))
              ]),
        ),
      ),
    ),
  );
}

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Center(
        child: RichText(
          text: TextSpan(
              text: "Wall",
              style: TextStyle(
                // fontFamily: 'serif',
                color: Colors.black87,
                fontSize: kIsWeb ? 25 : 20,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "Piper",
                    style: TextStyle(
                      // fontFamily: 'serif',
                      fontWeight: FontWeight.w500,
                      color: Colors.orange,
                      fontSize: kIsWeb ? 25 : 20,
                    ))
              ]),
        ),
      ),
    );
  }
}
