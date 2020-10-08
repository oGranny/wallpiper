import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpiper/data/data.dart';
import 'package:wallpiper/pages/fullPage.dart';

// ignore: unused_element
Widget newGrid({@required List wallpapers}) {
  return StaggeredGridView.countBuilder(
    padding: const EdgeInsets.all(8.0),
    crossAxisCount: 4,
    itemCount: wallpapers.length,
    itemBuilder: (context, i) {
      String imgPath = wallpapers[i];
      return Material(
        elevation: 8.0,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: () {
            // var documentDirectory;
            // kIsWeb
            //     ? documentDirectory = await getApplicationDocumentsDirectory()
            //     : documentDirectory = null;
            // print(documentDirectory);
            // _launchURL(url: imgPath);
            print(i);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreen(imgPath: imgPath),
                ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: imgPath,
              child: FadeInImage(
                image: NetworkImage(imgPath),
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/splash.png"),
              ),
            ),
          ),
        ),
      );
    },
    staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven ? 2 : 3),
    mainAxisSpacing: 8.0,
    // physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisSpacing: 8.0,
  );
}

Widget searchGrid({@required String query}) {
  // fetchSearch(query);
  return StaggeredGridView.countBuilder(
    padding: const EdgeInsets.all(8.0),
    crossAxisCount: 4,
    itemCount: wallpapers.length,
    itemBuilder: (context, i) {
      String imgPath = searchQuery[i];
      return Material(
        elevation: 8.0,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: () {
            // var documentDirectory;
            // kIsWeb
            //     ? documentDirectory = await getApplicationDocumentsDirectory()
            //     : documentDirectory = null;
            // print(documentDirectory);
            // _launchURL(url: imgPath);
            print(i);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreen(imgPath: imgPath),
                ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: imgPath,
              child: FadeInImage(
                image: NetworkImage(imgPath),
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/splash.png"),
              ),
            ),
          ),
        ),
      );
    },
    staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven ? 2 : 3),
    mainAxisSpacing: 8.0,
    // physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisSpacing: 8.0,
  );
}
