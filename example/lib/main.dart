import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:widget_to_image/encoded_widget.dart';
import 'package:widget_to_image/widget_to_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: WidgetToImage(
          pixelRatio: 3.0,
          format: ImageByteFormat.png,
          callback: (EncodedWidget widget) {
            print(widget.toBase64());
          },
          child: Logo(),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50
      ),
      padding: EdgeInsets.all(10),
      child: Text('An Example App', style: TextStyle(fontSize: 42),),
    );
  }
}