import 'package:flutter/material.dart';

class UiHelper {
  static pushReplacement(context, pageRoute) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => pageRoute));
  }

  static push1(context, pageRoute) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => pageRoute));
  }
}
