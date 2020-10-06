// * TODO: https://pub.dartlang.org/packages/intro_slider
import 'package:wallpiper/apikey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpiper/Widgets/appBar.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpiper/Widgets/bottomNavs.dart';
import 'package:wallpiper/Widgets/gridView.dart';
import 'package:wallpiper/Widgets/searchBar.dart';
// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:wallpiper/data/data.dart';
import 'package:wallpiper/pages/search.dart';
import 'package:wallpiper/theme.dart';

List searchQuery = List();
TextEditingController controller = TextEditingController();
ScrollController scontroller = ScrollController();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomNavBar(),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    fetchApi_();
    fetchCateggory();
    // print(categories);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future fetchApi_() async {
    try {
      http.Response response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=100&page=2",
        headers: {
          "Authorization": APIKEY,
        },
      );
      return (JSON.jsonDecode(response.body)["photos"].forEach(
        (i) {
          setState(() {
            wallpapers.add((i["src"]["portrait"]));
          });
        },
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    void fetchSearch(String query) async {
      http.Response response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=40&page=1",
        headers: {
          "Authorization": APIKEY,
        },
      );

      List tempList = new List();
      var data = JSON.jsonDecode(response.body);
      for (var i = 0; i < data["photos"].length; i++) {
        tempList.add(data["photos"][i]["src"]["portrait"]);
      }
      setState(() {
        searchQuery = tempList;
      });
    }

// String myText;

    Widget searchBar(
        BuildContext context, TextEditingController searchController) {
      return wallpapers != null
          ? SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffEEEEEE),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "search wallpapers",
                          border: InputBorder.none),
                    )),
                    InkWell(
                        onTap: () {
                          // searchQuery = [];
                          print(searchController.text);
                          // print(wallpapers);
                          // print(categories);
                          // fetchSearch(searchController.text);
                          fetchSearch(searchController.text);
                          print(searchQuery);
                          if (searchController.text != "" &&
                              searchQuery != []) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Search(
                                    query: searchController.text,
                                  ),
                                ));
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
            )
          : CircularProgressIndicator();
    }

    if (wallpapers.length != 0) {
      setState(() {});
      return SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        controller: scontroller,
        child: Container(
          color: primaryColor,
          // height: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: searchBar(context, controller),
              ),
              // SizedBox(height: 10),
              Expanded(
                // width: MediaQuery.of(context).size.width,
                child: newGrid(wallpapers: wallpapers),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/no_connection.png",
                height: MediaQuery.of(context).size.height * .4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Cannot fetch walpaper\nmake sure your network connection is stable",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }
    // return (newGrid(wallpapers: wallpapers));
  }
}
