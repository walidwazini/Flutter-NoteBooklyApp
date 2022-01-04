import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext ctx, String text, Color color) => {
    ScaffoldMessenger.of(ctx)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: color,
        content: Text(text),
      ))
  };
}