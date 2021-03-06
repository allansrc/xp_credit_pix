# xp_credit_pix

A new Flutter project: Built in the event HackaXP

![app](assets/app.gif)

- this apps requires Dart SDK version >=2.16.0
- an APK file is avaliable on release section

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
┃   ┃   ┗ core              // code app feat: networking, encryption, local storage
┃   ┃       ┗ lib
┃   ┃           ┣ main.dart
┃   ┃           ┗ ...
┃   ┃
┃   ┣ flavors
┃   ┃    ┣ main_production.dart
┃   ┃    ┗ ...
┃   ┃
┃   ┗ main.dart             // app's entry point
┃
┃
┣ analysis_options.yaml     // rules for lint/style guide
┣ pubspec.yaml              // core app dependences
┣ README.md
┃
┃
┣ shared                   // feature's shared dependences and developer dependences
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

## Clean Architecture layers

1. Enterprise Business Rules
2. Application Business Rules
3. Interface Adapters
4. Frameworks & Drivers (External)

   <img src="https://raw.githubusercontent.com/Flutterando/Clean-Dart/master/imgs/img3.png" width=250/>

## Run and build

to run from and target flavor run the script bellow:

dev;

```(bash)
flutter run -d all --flavor dev -t lib/flavors/main_development.dart
```

staging;

```(bash)
flutter run -d all --flavor ho -t lib/flavors/main_staging.dart
```

prod;

```(bash)
flutter run -d all --flavor prod -t lib/flavors/main_production.dart
```

or if you are using VSCode all debug/run profiles are added

## Create a new feature

Every feature in this approach is an "micro app", it means that each feature can be added and removed as an plugin. to create an feature we recommend use flutter plugin/package creation.

run:

```(bash)
flutter create --template=package feature_name
```

## Dependences, DI and Routing

We use modular_flutter for this project to manage Dependence Injection (DI) and routing.

- To follow our binder pattern use the custom snippet `difeat` to generate the binderDI
- To Feature Modules use `dimod` to generate the proper class base model.

## Unit, Integration and Widgets Tests

Tests were ainmed for this project. But has come some embezzlement that make it not able for this stage of development.

## Credentials

To run this application you need to provide credentials, which will be loaded from the workspace/lib/app/core/networking/core.credentials.dart.

- if `core.credentials.dart` file doesn't exist on the folder, please create it.
- run `xpcred` snippet to generate the defaut class for Credentials. the output willbe something like that:

```
class CoreCredentials {
    static const String clientID = '';
    static const String secretKey = '';
}
```

## Done Services

All layer from Authentication to main api `/oauth2/v1/access-token`:

- domain
- usecase
- infra
- repositories
- errors handler
- mappers
- custom either

## Pending Services

All Open Baning api consuming is pending.

## UI

All main UI ainmed are done. some integration to services (stores/controllers) are pending to implementation

## Refs

A few resources to get you started:

- [Clean Dart](https://github.com/Flutterando/Clean-Dart)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
