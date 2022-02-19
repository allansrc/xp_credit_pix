# xp_ob

A new Flutter project: Built in the event HackaXP

## Getting Started

This project is a starting point for a Flutter application.

- For the Hacka prototype, check develop branch

## Architecture

The Entire app is inspired on Clean Arch concepts, ainming on scalability, code/team's maintanence  

```
main_app
┣ android
┣ ios
┣ lib
┃   ┣ app
┃   ┃   ┣ modules           // app's modules
┃   ┃   ┃   ┣ some_module
┃   ┃   ┃   ┣ another_module
┃   ┃   ┃   ┗ ...
┃   ┃   ┃ 
┃   ┃   ┃
┃   ┃   ┗ core              // code app feat: networking, encryption, local storage
┃   ┃       ┗ lib
┃   ┃           ┣ main.dart
┃   ┃           ┗ ...
┃   ┃   
┃   ┃   
┃   ┗ main.dart             // app's entry point
┃
┃
┣ analysis_options.yaml     // rules for lint/style guide
┣ pubspec.yaml              // core app dependences
┣ README.md
┃
┃
┣ shared            // feature's shared dependences and developer dependences
┃   ┗ shared 1
┃       ┣ shared 2
┃       ┗ ... 
┃
┃
┣ features                  // Feature from app's modules
┃   ┣ feature 1
┃   ┃   ┣ src               // feature code
┃   ┃   ┗ lib
┃   ┃      ┗ main.dart
┃   ┣ feature 2
┃   ┗ ...
┗ ...
```



## Refs

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
