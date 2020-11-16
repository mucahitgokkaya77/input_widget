import 'package:flutter/material.dart';
import 'package:input_ilk/stepper_kullanim.dart';

void main() {
  runApp(MaterialApp(
    title: "İnput İşlemleri",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: StepperKullanim(),
  ));
}
