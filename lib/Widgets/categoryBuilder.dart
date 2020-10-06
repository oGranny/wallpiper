import 'package:flutter/material.dart';

Widget categoryBuilder(BuildContext context, int i) {
  return Container(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset("splash.png"),
    ),
  );
}
