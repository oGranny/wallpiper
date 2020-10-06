import 'package:wallpiper/apikey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:wallpiper/models/wallpaperModel.dart';

List rawCategories = <String>[
  "Abstract",
  "Animals",
  "Drinks",
  "Holiday",
  "Entertainment",
  "Food",
  "Nature",
  "People",
  "Sports",
  "Technology",
  "Vehicles",
  "World",
  "3D",
  "Alone",
  "Anime",
  "Art",
  "Black",
  "Cars",
  "City",
  "Fantasy",
  "Flowers",
  "Food",
  "Macro",
  "Mask",
  "Motorcycles",
  "Music",
  "Nature",
  "Neon",
  "Predator",
  "Smiles",
  "Space",
  "Sports",
  "Summer",
  "Textures",
  "Vector",
  "White",
  "Winter",
  "Words"
];
List searchQuery = List();
List wallpapers = List();
List categories = List();

Future fetchApi() async {
  try {
    http.Response response = await http.get(
      "https://api.pexels.com/v1/curated?per_page=50&page=2",
      headers: {
        "Authorization": APIKEY,
      },
    );
    return (JSON.jsonDecode(response.body)["photos"].forEach(
      (i) {
        wallpapers.add((i["src"]["portrait"]));
      },
    ));
  } catch (e) {
    print(e);
  }
}

Future fetchCateggory() async {
  try {
    rawCategories.forEach((element) async {
      // http.Response response = await http.get(
      //     // "https://pexabay.com/api/?key=$PEXAKEY&q=yellow+flower&orientaion=vertical&page=1&per_page=3&pretty=true",
      //     "https://pixabay.com/api/?key=$PEXAKEY&q=$element&orientation=vertical&image_type=photo&pretty=true");
      // print(JSON.jsonDecode(response.body));
      // print(JSON.jsonDecode(response.body)["hits"][0]["largeImageURL"] + "\n");
      // var url = JSON.jsonDecode(response.body)["hits"][0]["largeImageURL"];
      return categories.add(
        CategoryModel(
          url: "None",
          title: element,
        ),
      );
    });
  } on NoSuchMethodError {
    print("error: rate limit exceeded");
    return;
  } catch (e) {
    print("err $e");
  }
}

Future fetchSearch1(String query) async {
  try {
    http.Response response = await http.get(
      "https://api.pexels.com/v1/search?query=$query&per_page=40&page=1",
      headers: {
        "Authorization": APIKEY,
      },
    );
    return (JSON.jsonDecode(response.body)["photos"].forEach(
      (i) {
        searchQuery.add((i["src"]["portrait"]));
      },
    ));
  } catch (e) {
    print(e);
  }
}

void fetchSearch2(String query) async {
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
}
