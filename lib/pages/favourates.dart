import 'package:flutter/material.dart';
import 'package:wallpiper/Widgets/gridView.dart';
import 'package:wallpiper/pages/fullPage.dart';
import 'package:wallpiper/theme.dart';

class Favourates extends StatelessWidget {
  const Favourates({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favourate.length != 0)
      return Container(child: newGrid(wallpapers: favourate));
    else
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/the-list-is-empty.png",
                height: MediaQuery.of(context).size.height * .4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your favourates list is empty",
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
  }
}
