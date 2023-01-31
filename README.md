<h1 align="center">MobiServant flutter mobile app</h1>

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
Mobiservant also serves address navigation with OCR and Maps -component.

**You can try the app by downloading and installing the apk: [Mobiservant.apk](https://drive.google.com/file/d/1nm8tapEYahU6lFFqWWqukHeWGX6yQspY/view?usp=share_link)**

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
