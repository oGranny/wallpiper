// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpiper/data/data.dart';
// import 'package:wallpiper/data/data.dart';

String myText;

Widget searchBar(BuildContext context, TextEditingController searchController) {
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
                      hintText: "search wallpapers", border: InputBorder.none),
                )),
                InkWell(
                    onTap: () {
                      print(searchController.text);
                      // print(kIsWeb);
                      // print(wallpapers);
                      // print(DateTime.parse("2020-10-05 14:15:50.351"));
                      // print(wallpapers.length);
                      // print(categories[0].url);
                      // if (searchController.text != "") {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => SearchView(
                      //                 search: searchController.text,
                      //               ),
                      //           ));
                      // }
                    },
                    child: Container(child: Icon(Icons.search)))
              ],
            ),
          ),
        )
      : CircularProgressIndicator();
}
