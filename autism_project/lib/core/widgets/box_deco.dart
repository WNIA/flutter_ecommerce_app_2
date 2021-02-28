import 'package:flutter/material.dart';

BoxDecoration boxDeco() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(color: Colors.blue[100], blurRadius: 2, spreadRadius: 2, offset: Offset.fromDirection(20))
      ]);
}