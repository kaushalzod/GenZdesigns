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
* GenZCountdown

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

* then import package 
  * `import 'package:gen_z_designs/gen_z_designs.dart'`
#### How to use:

###### GenZButton 

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

###### GenZButton with badge

```dart
// Button with badge outside it.
// Default type of badge button
GenZButton(
    text: "Text Button",
    onPressed: () {},
    badge: true,
    type: GenZButtonType.OUTLINED,
    badgeColor: Colors.red,
);

// Button with badge inside it.
GenZButton(
    text: "Text Button",
    onPressed: () {},
    badge: true,
    type: GenZButtonType.OUTLINED,
    badgeColor: Colors.amber,
    badgeType: BadgeType.INSIDE,
    badgeText: const Icon(Icons.abc, size: 10),
);

// Try new prams of badges in GenZButton 
```
###### GenZCountDown

 ```dart
// Basic Use of GenZCountdown for countdown for 300sec.
// Will print GenZ Sale Ended when countdown completed.
GenZCountdown(
    duration: Duration(seconds: 300),
    onDone: () => print("GenZ Sale Ended"),
);

// Basic Use of GenZCountdown for countUp till 300sec.
GenZCountdown(
    duration: Duration(seconds: 300),
    isIncremental: true,
    onDone: () => print("GenZ Sale Ended"),
);

// Also try many params of GenZCountdown
```
## Additional information

Checkout everything at: https://github.com/kaushalzod/GenZdesigns
