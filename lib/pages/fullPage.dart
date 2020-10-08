import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpiper/models/wallpaperModel.dart';
import 'package:wallpiper/theme.dart';

var path;
List favourate = List();

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  String imgPath;
  FullScreen({@required this.imgPath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(imgPath),
    );
  }
}

class Body extends StatefulWidget {
  final String imgPath;
  Body(this.imgPath);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // static const platform =
  //     const MethodChannel('com.example.wallpaper_app/wallpaper_app');
  _askPermission() async {
    if (await Permission.storage.request().isGranted) {
      print("permission granted");
    } else {
      print("permission denied");
    }
  }

  @override
  void initState() {
    super.initState();
    _askPermission();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    _askPermission() async {
      if (await Permission.storage.request().isGranted) {
        print("permission granted");
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Storage permission is needed"),
        ));
      }
    }

    _save(String imgPath) async {
      await _askPermission();
      var response = await Dio()
          .get(imgPath, options: Options(responseType: ResponseType.bytes));
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      print(result);
      Navigator.pop(context);
    }

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                        icon: Icon(Icons.close),
                        tooltip: "close",
                        onPressed: () => Navigator.of(context).pop()),
                    actions: [
                      kIsWeb
                          ? Text("")
                          : IconButton(
                              icon: Icon(Icons.file_download),
                              tooltip: "Close",
                              onPressed: () {
                                _save(widget.imgPath);
                                // Navigator.pop(context);
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Downloaded wallpaper successfully"),
                                  ),
                                );
                              },
                            ),
                      IconButton(
                        icon: Icon(Icons.favorite_outline),
                        tooltip: "Add to favourates",
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Added to favourates"),
                          ));
                          setState(() {
                            favourate.add(widget.imgPath);
                          });
                          print("object");
                          // (favourate.forEach((element) {
                          //   print(element.imgPath);
                          // }
                          // ))
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Hero(
                tag: widget.imgPath,
                child: Image.network(widget.imgPath),
              ),
            ),
            Container(
              // color: primaryColor,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      kIsWeb || Platform.isIOS
                          ? _launchURL(widget.imgPath)
                          : print(widget.imgPath);
                      // print(path);
                      // : _askPermission();
                      // progressString =
                      //     Wallpaper.ImageDownloadProgress(widget.imgPath);
                      // progressString.listen((data) {
                      //   setState(() {
                      //     res = data;
                      //     downloading = true;
                      //   });
                      //   print("data recieved: $data");
                      // }, onDone: () async {
                      //   String home = await Wallpaper.homeScreen();
                      //   setState(() {
                      //     downloading = false;
                      //     home = home;
                      //   });
                      //   print("task done");
                      // }, onError: (error) {
                      //   print(error);
                      //   setState(() {
                      //     downloading = false;
                      //   });
                      // });
                    },
                    //TODO: impliment proper wallpaper setup for mobile
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white24, width: 1),
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0x36FFFFFF),
                                    Color(0x0FFFFFFF)
                                  ],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight)),
                          child: kIsWeb
                              ? RichText(
                                  text: TextSpan(
                                    text: "Download Wallpaper",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      // color: Theme.of(context,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: "\n        new tab will open",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Text(
                                  "Set Wallpaper",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
