# :pushpin: Flutter Newspaper

[![Generic badge](https://img.shields.io/badge/Flutter-2.8.1-blue)](https://flutter.dev/docs)
[![Generic badge](https://img.shields.io/badge/Dart-2.15.1-blue)](https://dart.dev/guides)
[![Generic badge](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/licenses/MIT)
[![Generic badge](https://img.shields.io/badge/Platform-iOS,Android,Web,MacOs-purple)](https://dart.dev/guides)
[![test](https://github.com/fauziridwan1709/newspaper/actions/workflows/test.yaml/badge.svg?branch=main)](https://github.com/fauziridwan1709/newspaper/actions/workflows/test.yaml)
[![Generic badge](https://img.shields.io/badge/development-v0.0.1-brightgreen)](https://github.com/fauziridwan1709/newspaper)
[![Generic badge](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
![Coverage](./coverage_badge.svg?sanitize=true)

Newspaper app

## 	:round_pushpin: TODO
- [X] BLoC Bases.
- [X] Core Material Component.
- [X] Example Feature (Include Unit Test): Example Github Search Users, Repos, and Issues.
- [X] Theme Abstraction (normal, dark, and other).
- [X] Linter.
- [X] Github Actions (CI/CD).
- [X] Flavor & App Config (Endpoints).
- [X] Code coverage.
- [X] Firebase Analytics.
- [X] Firebase Crashlytics.
- [ ] Firebase Messaging.
- [X] Singletons (DIO & other services).
- [X] Formatter.    
- [X] WebView Service.
- [X] Localization.
- [ ] Model Generator.
- [ ] Fastlane.
- [ ] Documentations (Readme.md's & Wikis).
- [ ] StoryBook.

## ⚡️Getting Started

### :evergreen_tree: Project Tree
```tree
├── .github
│   └── workflows
│       ├── test.yml
│       └── report.yml
│ 
├── android
├── assets
│   ├── icons
│   ├── images
│   └── screenshots
│
├── ios  
├── lib
│   ├── core
│   │   ├── bases
│   │   ├── client
│   │   ├── constants
│   │   ├── environments
│   │   ├── errors
│   │   ├── extensions
│   │   ├── screen
│   │   └── theme
│   │
│   ├── feaures
│   │   └── news
│   │       ├── daa
│   │       ├── domain
│   │       └── presentation
│   │
│   ├── l10n
│   │   ├── app_en.arb
│   │   ├── app_id.arb
│   │   └── l10n.dart
│   │
│   └── services
│       ├── date_service.dart
│       ├── launch_service.dart
│       ├── local_notification_service.dart
│       ├── navigation.dart
│       ├── share_service.dart
│       ├── shared_preferences_service.dart
│       └── widget_service.dart
│ 
├── macos 
├── test
│   ├── integration
│   ├── unit
│   ├── widget
│   └── dio_mocks.dart
│
├── web
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── CHANGELOG.md
├── genhtml.perl
├── LICENSE
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

A brief description of the layout:

* `.github` has one github workflows directory.
* `android` is android configuration directory.
* `.gitignore` varies per project, but all projects need to ignore `bin` directory.
* `test.yml` is the flutter-dart-lint config file.

Notes:

* genhtml.perl **MUST NOT** change well-defined command semantics, see genhtml.perl for details.

### :hammer_and_pick: Configurations

1. Change package name, bundle id (iOS) or application id (android).
   Reference:
    - [change package name](https://medium.com/@skyblazar.cc/how-to-change-the-package-name-of-your-flutter-app-4529e6e6e6fc)
2. Create your own keystore and key.properties.
   Reference:
    - [App Signing (keystore)](https://developer.android.com/studio/publish/app-signing)
    - [create keystore using Keytool](https://medium.com/@tom.truyen/create-an-android-keystore-using-keytool-commandline-10399a62e774)
3. Setup your firebase project for firebase analytics, crashlytics, and messaging.
   Reference:
    - [Understand Firebase Project](https://firebase.google.com/docs/projects/learn-more)
    - [Firebase analytics](https://pub.dev/packages/firebase_analytics)
    - [Firebase crashlytics](https://pub.dev/packages/firebase_crashlytics)

### 🚚 How to run, drive, and build Apk

Make sure run this command before run the app to generate localizations.
```shell
flutter gen-l10n
```

Example how to run debug development app
```shell
flutter clean
flutter pub get
flutter run -t lib/main_development.dart --release --flavor debuging
```
Example how to run release development app
```shell
flutter clean
flutter pub get
flutter run -t lib/main_development.dart --release --flavor development
```
If you want to run with different flavor change development to specific flavor. for ex:
```shell
flutter run -t lib/main_staging.dart --release --flavor staging
flutter run -t lib/main_production.dart --release --flavor production
```

Example how to build release development app
```
flutter clean
flutter pub get
flutter build apk -t lib/main_development.dart --release --no-shrink --flavor development --split-per-abi
```
If you want to build with different flavor change development to specific flavor. for ex:
```shell
flutter build apk -t lib/main_staging.dart --release --no-shrink --flavor staging --split-per-abi
flutter build apk -t lib/main_production.dart --release --no-shrink --flavor production --split-per-abi
```

Example how to run flutter web app
```
flutter run -t lib/main_development.dart -d chrome
```

Example how to drive automation test on development environment
note that automation test doesn't support release mode
```
flutter drive -t test_driver/app.dart --flavor development
```

### ⚙️ Supported Flavor

1. debuging
2. development
3. staging
4. production

### 🎯 Architecture & Pattern

Reso coder's fllutter clean architecture

![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)

### 🧬️ State Management

Using [flutter BLoC](https://pub.dev/packages/flutter_bloc) for Business Logic Component Design Pattern.

### :test_tube: How to Test Coverage

- on MacOs ```flutter test --coverage && genhtml -o coverage coverage/lcov.info```
- on Windows ```flutter test --coverage```. Then open your git bash and type ```./genhtml.perl coverage/lcov.info -o coverage/html```

### :new: Versioning

Using Semantic Versioning 2.0.0

Major.Minor.Patch

Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

### :capital_abcd: Naming Convention

snake_case for file and folder.

### :beach_umbrella: Theme

```dart
/// Abstraction for material theme.
abstract class AppTheme {
  ThemeData lightTheme();
  ThemeData darkTheme();
  
  // TODO(any): Specify if you have another theme.
  // ex: ThemeData auto();
}
```

```dart
/// Implementation for app material theme.
class AppThemeImpl implements AppTheme {
  // TODO(Any): Specify dark theme.
  @override
  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
      primaryColor: BaseColors.black,
    );
  }

  // TODO(Any): Specify light theme.
  @override
  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
      primaryColor: BaseColors.primary,
    );
  }
}
```

```dart
class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final AppTheme appTheme = AppThemeImpl();

  static final _lightTheme = appTheme.lightTheme();
  static final _darkTheme = appTheme.darkTheme();

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
```
