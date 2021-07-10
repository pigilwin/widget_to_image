import 'dart:convert';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class EncodedWidget {

  static Future<EncodedWidget> fromRenderRepaintBoundary(
    RenderRepaintBoundary boundary,
    double pixelRatio,
    ImageByteFormat format
  ) async {
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: format);
    return EncodedWidget(byteData!);
  }

  final ByteData byteData;

  EncodedWidget(this.byteData);

  String toBase64() {
    final data = byteData.buffer.asUint8List();
    return base64Encode(data);
  }
}