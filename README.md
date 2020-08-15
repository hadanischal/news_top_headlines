# news_top_headlines
## Requirements:
* Flutter 1.20.1
* Dart 2.9.0
* sdk: ">=2.7.0 <3.0.0"

## Objective:
`Flutter` project to demonstrate some aspect of clean architecture using  MVVM pattern **SOLID principles**.

## App Goal:
* This project was intended to work as a News List demo projects for iOS using Swift. 
* The demo uses the [News API](https://newsapi.org) which returns information in a JSON format.

## Installation
- Run setup script file 
  - `./setup.sh`

- Or if you prefer follow following step
  - Install dependency  `flutter pub get`
  - Run Setting up build_runner command `flutter packages pub run build_runner watch --delete-conflicting-outputs`
- Open a device to run `open -a Simulator`
- Run flutter project `flutter run`

## 3rd Party Libraries
 - **`cupertino_icons`** - [flutter/cupertino_icons](https://github.com/flutter/cupertino_icons) Default icons asset used by Flutter's Cupertino widgets
 - **`dio`** - [flutterchina/dio](https://github.com/flutterchina/dio) Http client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc.
 - **`retrofit`** - [trevorwang/retrofit.dart](https://github.com/trevorwang/retrofit.dart) is an dio client generator using source_gen and inspired by Chopper and Retrofit.
 - **`provider`** - [rrousselGit/provider](https://github.com/rrousselGit/provider) A wrapper around InheritedWidget to make them easier to use and more reusable..
 - **`webview_flutter`** - [flutter/plugins/webview_flutter](https://pub.dev/packages/webview_flutter) A Flutter plugin that provides a WebView widget on Android and iOS.
  
 - **`build_runner`** - [dart-lang/build](https://github.com/dart-lang/build) A build system for Dart code generation and modular compilation.
 - **`json_serializable`** - [google/json_serializable.dart](https://github.com/google/json_serializable.dart) Automatically generate code for converting to and from JSON by annotating Dart classes.
 - **`lint`** - [passsy/dart-lint](https://github.com/passsy/dart-lint) An opiniated, community-driven set of lint rules for Dart and Flutter projects. Like pedantic but stricter.


## Design patterns:
### MVVM:
- MVVM - My preferred architecture.
    - MVVM stands for “Model View ViewModel”
- Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:
  - Models hold application data. They’re usually simple classes.
  - Views display visual elements and controls on the screen. They’re typically StatelessWidget or StatefulWidget.
  - View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

![Alt text](/README/MVVM.jpeg?raw=true)


## Screenshot:

![Screen Shot 1](/README/screenshot1.png?raw=true)


 #### App Demo

 ![](/README/demo.gif "")