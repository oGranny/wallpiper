import 'package:flutter/material.dart';
import 'package:wallpiper/Widgets/appBar.dart';
import 'package:wallpiper/Widgets/bottomNavs.dart';
// import 'package:wallpiper/Widgets/categoryBuilder.dart';
import 'package:wallpiper/data/data.dart';
import 'package:wallpiper/pages/search.dart';
import 'package:wallpiper/theme.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: normalNavBar(context),
      body: CategoryB(),
    );
  }
}

class CategoryB extends StatefulWidget {
  @override
  _CategoryBState createState() => _CategoryBState();
}

class _CategoryBState extends State<CategoryB> {
  @override
  void initState() {
    super.initState();
    // fetchCateggory();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Container(
      color: primaryColor,
      child: GridView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Search(
                                  // query: searchController.text,
                                  ),
                            ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                              // "assets/categories/${categories[index].title}.jpeg"
                              "assets/categories/${categories[index].title}.jpeg"
                              // fit: BoxFit.fill,
                              ),
                          placeholder: AssetImage("assets/splash.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    categories[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(30),
            //   child: Image.network(categories[index].url),
            // ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.5,
          mainAxisSpacing: 0.5,
        ),
        shrinkWrap: true,
        itemCount: categories.length,
      ),
    );
  }
}
