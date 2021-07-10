import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_to_image/encoded_widget.dart';

import 'package:widget_to_image/widget_to_image.dart';

void main() {
  testWidgets('Create a text widget with just letters and convert to base64', (WidgetTester tester) async {

    var base = '';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: WidgetToImage(
          child: Text('base64'),
          pixelRatio: 3.0,
          format: ImageByteFormat.png,
          callback: (EncodedWidget widget) {
            base = widget.toBase64();
          },
        ),
      ),
    ));

    print(base);
  });
}
