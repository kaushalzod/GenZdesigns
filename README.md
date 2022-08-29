<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## About Package

 GenZdesigns is an open source library that come with pre-build & easy to customize UI components for GenZ's to fasten and ease their development.

## Features

* GenZButton  

## Getting started

`
flutter pub add gen_z_design
`

## Usage

To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/kaushalzod/GenZdesigns/blob/master/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    gen_z_designs:
```
#### How to use

import `import 'package:gen_z_designs/gen_z_designs.dart'` \ 

```dart
// Basic Use of GenZButton 
GenZButton(
    onPressed: () {},
    text: "GenZdesign: Designs of new Generation.",
);

// GenZButton with outline
GenZButton(
    onPressed: () {},
    text: "GenZdesign: Designs of new Generation.",
    type: GenZButtonType.OUTLINED,
);

// GenZButton with Transparent
GenZButton(
    onPressed: () {},
    text: "GenZdesign: Designs of new Generation.",
    type: GenZButtonType.TRANSPARENT,
);

// Try these below properties in GenZButton

GenZPosition { LEADING, TRAILING, CENTER }
GenZButtonShape { SQUARE, PILL, DEFAULT }
GenZSize { SMALL, MEDIUM, LARGE, XLARGE }
GenZButtonType { FILL, TRANSPARENT, OUTLINED, OUTLINED2X }

```

## Additional information

Checkout everything at: https://github.com/kaushalzod/GenZdesigns
