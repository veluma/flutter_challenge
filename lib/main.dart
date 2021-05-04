import 'package:coding_challenge/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(codeCity: "742676", cityName: "Lisbon"),
      debugShowCheckedModeBanner: false,
    )
  );
}
