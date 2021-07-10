library widget_to_image;

import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_to_image/encoded_widget.dart';

typedef WidgetImageCallback = void Function(EncodedWidget widget);

class WidgetToImage extends StatefulWidget {

  final Widget child;
  final double pixelRatio;
  final ImageByteFormat format;
  final WidgetImageCallback callback;

  WidgetToImage({
    required this.child,
    required this.pixelRatio,
    required this.format,
    required this.callback
  });

  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {

  final globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(convertToImage);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: widget.child,
      key: globalKey,
    );
  }

  void convertToImage(Duration duration) async {
    final boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final encodedWidget = await EncodedWidget.fromRenderRepaintBoundary(
      boundary, 
      widget.pixelRatio, 
      widget.format
    );
    widget.callback(encodedWidget);
  }
}