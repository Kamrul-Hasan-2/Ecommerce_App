import 'package:flutter/material.dart';

void snackBarMessage(BuildContext context, String msg,
    [bool isErrorMessage = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: isErrorMessage ? Colors.white : Colors.white,
        ),
      ),
      backgroundColor: isErrorMessage ? Colors.red : Colors.green,
    ),
  );
}
