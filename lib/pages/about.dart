import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpiper/Widgets/appBar.dart';
import 'package:wallpiper/Widgets/bottomNavs.dart';
import 'package:wallpiper/constants.dart';

import '../theme.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      bottomNavigationBar: normalNavBar(context),
      body: AboutBody(),
    );
  }
}

class AboutBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<AboutBody> {
  bool _modeDark = darkMode;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: primaryColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Dark Mode",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor),
                  ),
                  Spacer(),
                  Switch(
                    value: this._modeDark,
                    // value: darkMode,
                    onChanged: (bool value) => setState(() {
                      this._modeDark = value;
                      // darkMode = value;
                      _modeDark == true
                          ? primaryColor = darkPrimaryColor
                          : primaryColor = lightPrimaryColor;
                      _modeDark == true
                          ? secondaryColor = darkSecondaryColor
                          : secondaryColor = lightSecondaryColor;
                      _modeDark == true
                          ? textColor = darkTextColor
                          : textColor = lightTextColor;
                      setState(() {});
                      // });
                      // currentTheme = DarkTheme();
                      // ignore: todo
                      //TODO: impiment dark mode
                    }),
                    activeColor: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black12,
                height: 1,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "About",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage(
                          "assets/wallpiper.png",
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        text: "Wall",
                        style: TextStyle(
                          // fontFamily: 'serif',
                          color: textColor,
                          fontSize: 27.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Piper",
                            style: TextStyle(
                              // fontFamily: 'serif',
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              fontSize: 27.5,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Version: $version",
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () => this._launchURL("https://wallpiper.web.app"),
                      // onTap: () => print("url launcher depricated"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "web app ",
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "wallpiper.web.app",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "License MIT",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.green,
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    _launchURL("https://github.com/oGranny");
                  },
                  // onTap: () => print("url_launcher depricated"),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Copyright ©2020, All rights reserved\n",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
