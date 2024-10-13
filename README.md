# Firebase Todo App 🚀

This repository contains the source code for the tutorial **[Building a Firebase Todo App: The Fun, Beginner-Friendly Way! 🚀](https://medium.com/@tech.ramakant/building-a-firebase-todo-app-the-fun-beginner-friendly-way-75278f93bdde)** published on Medium. It walks you through the steps of creating a Flutter-based Todo app with **Firebase Firestore** integration for real-time data handling. This app is beginner-friendly, engaging, and scalable.


## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Firebase Configuration](#firebase-configuration)
- [License](#license)
- [Contribution Guidelines](#contribution-guidelines)
- [Contact](#contact)

## Introduction

Welcome to the **Firebase Todo App**! This project is a Flutter app that integrates with **Firebase Firestore** to manage tasks, showcasing features like real-time data updates, swipe-to-delete, and status toggling. Perfect for anyone looking to get started with Flutter and Firebase!

## Features
- 🛠 **Add Todos**: Add new tasks with a simple and intuitive interface.
- 📋 **Mark as Completed**: Use checkboxes to keep track of what you’ve done. Feel the productivity boost! ✅
- 💨 **Real-Time Updates**: Enjoy instant synchronization of todos across all devices using Firestore.
- 🧹 **Swipe-to-Delete**: Swipe an item to reveal the delete action, inspired by Gmail’s design. 🧹

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/firebase_todo_app.git
   cd firebase_todo_app
   ```

2. Install the required dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```

## Dependencies

This app uses the following packages:

- **[firebase_core](https://pub.dev/packages/firebase_core)**: For Firebase Firestore integration.
- **[cloud_firestore](https://pub.dev/packages/cloud_firestore)**: Core package for connecting Flutter to Firebase.
- **flutter**: The core framework for building natively compiled applications for mobile, web, and desktop.

Make sure you have the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
   flutter:
      sdk: flutter
   firebase_core: latest_version
   cloud_firestore: latest_version
```

## Firebase Configuration

Android:
- Add the google-services.json file to android/app.
- Ensure you have the following in android/build.gradle:

```groovy
dependencies {
    classpath 'com.google.gms:google-services:4.4.2'
}
```

- And in android/app/build.gradle:

```groovy
apply plugin: 'com.google.gms.google-services'
```

- Don’t forget to enable internet permission in AndroidManifest.xml:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

iOS:
- Add your iOS app in the Firebase Console.
- Download GoogleService-Info.plist and place it in your Xcode project under Runner/.
- Update the ios/Podfile and add the Firebase dependencies in Xcode:

```ruby
platform :ios, '10.0'
use_frameworks!
```

- Add firebase_core initialization in AppDelegate.swift.

## License
This project is licensed under the MIT License. Feel free to use, modify, and distribute as needed.

For more details, check out the LICENSE file.

## Contribution Guidelines
Contributions are always welcome! If you'd like to contribute, feel free to submit a pull request or open an issue.

## Contact
- Email: [tech.ramakanttiwari@gmail.com](mailto:tech.ramakanttiwari@gmail.com)
- Medium: [@tech.ramakant](https://medium.com/@tech.ramakant)
- LinkedIn: [@tech-ramakant](https://www.linkedin.com/in/ramakant-tiwari-593479128)
- YouTube: [@Tech.Ramakant](https://www.youtube.com/@Tech.Ramakant)

Thank you for checking out the repository! 🎉
   
