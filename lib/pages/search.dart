// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:wallpiper/Widgets/gridView.dart';
import 'package:wallpiper/data/data.dart';

import '../theme.dart';
// import 'package:wallpiper/data/data.dart';

class Search extends StatefulWidget {
  final String query;
  Search({Key key, @required this.query}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
    Search(query: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return newGrid(
      wallpapers: searchQuery,
    );
  }
}
