<h1 align="center">MobiServant mobile app</h1>

---

## Table of Contents

- [General information](#general)
- [How to run project](#use)
- [Testing](#testing)
- [Folder structure](#structure)
- [UI](#ui)
- [Routes](#routes)

## General information <a name = "general"></a>

|  | Description |
|--------|--------|
| Project | Cross platform mobile project |
| Technologies | Flutter |

Mobiservant is an mobile application made using Flutter.

Mobiservant is made for assistance. App uses OCR -component to increase text size or read the text aloud.
Mobiservant can also attempt to recognize street address from text and provide navigation help with OCR and Google Maps.

Mobiservant has no language support and is in Finnish only.

**You can try the app on your Android device by downloading and installing the apk: [Mobiservant.apk](https://drive.google.com/file/d/1Ca8FZ0Rnq6NqKQCvlJ8mK2KnmYlYftY8/view?usp=sharing)**

## How to run project<a name = "use"></a>

**Step 1:**

Clone this repository:

```
https://github.com/Hnes-co/mobiServant.git
```

**Step 2:**

Go to /mobi_servant and execute the following command to get all dependencies: 

```
flutter pub get 
```

**Step 3:**

Install Android emulator using Android Studio

**Step 4:**

Build and run the project:

```
Run -> Start Debugging
```

## Testing<a name = "testing"></a>
This application uses unit testing.

To run unit testing, insert in to terminal:

```
flutter test
```

## Folder structure<a name = "structure"></a>
mobi_servant/
|- android
|- ios
|- lib
|- test
|- web
|- windows

## UI<a name = "ui"></a>

This directory contains all the ui of your application.

```
lib/
|- main.dart
|- navigation.dart
|- read_text.dart
|- zoom_text.dart
```

## Routes<a name = "routes"></a>
File main.dart is the starting point of the application. User can navigate to 3 different views from main.dart.

```dart
import 'package:mobi_servant/read_text.dart';
import 'package:mobi_servant/navigation.dart';
import 'package:mobi_servant/zoom_text.dart';
```
