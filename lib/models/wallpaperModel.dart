import 'package:flutter/cupertino.dart';

class WallpaperModel {
  String url;
  String src;
}

class CategoryModel {
  String url;
  String title;
  CategoryModel({@required this.url, @required this.title});
}

class FavourateModel {
  String imgPath;
  bool isFav;
  FavourateModel({@required this.imgPath, @required this.isFav});
}

class SearchModel {
  String url;
  SearchModel({this.url});
}
