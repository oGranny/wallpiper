import 'package:flutter/material.dart';
import '../theme.dart';
// import 'package:wallpiper/data/data.dart';

// class Search extends StatefulWidget {
//   final String query;
//   Search({Key key, @required this.query}) : super(key: key);
//   @override
//   _SearchState createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   @override
//   void initState() {
//     super.initState();
//     Search(query: widget.query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return newGrid(
//       wallpapers: searchQuery,
//     );
//   }
// }

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/hugo-under-construction.png",
            height: MediaQuery.of(context).size.height * .4,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "This place is still under construction\ncheck out after the update",
            textAlign: TextAlign.center,
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
