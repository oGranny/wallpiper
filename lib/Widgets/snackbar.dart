import 'package:flutter/material.dart';

ssnackBar(BuildContext context, String message) {
  SnackBar snackbar = SnackBar(
    content: Text(message),
  );
  return Scaffold.of(context).showSnackBar(snackbar);
}
