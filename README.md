# Widget To Image

![logo for the package](./images/logo.png "Widget to Image")

A package for creating images from the widgets within your flutter application. The logo for the package above has been generated using this package.

## Customisation properties

The widget can be customised to convert the child widget into a image. These properties are as follows:

- `pixelRatio` - This the scale between the logical pixels and the size of the output image. It is independent of the [dart:ui.FlutterView.devicePixelRatio] for the device, so specifying 1.0 (the default) will give you a 1:1 mapping between logical pixels and the output pixels in the image.
- `format` - specifies the format in which the bytes will be returned.
- `child` - The child to be converted to the image

```dart
WidgetToImage(
  pixelRatio: 3.0,
  format: ImageByteFormat.png,
  callback: (EncodedWidget widget) {
    print(widget.toBase64());
  },
  child: Child(),
)
```

## A working Example

An example app with working code can be found in the `example` directory

## How to run the tests

How to run the tests and check the coverage is 100%.
Run the test with `flutter test --coverage`.
Once this has been completed use `genhtml coverage/lcov.info --o coverage/html`.
This will generate the viewable coverage information from the flutter tests, use `open coverage/html/index.html`.
