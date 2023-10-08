# Flutter Todos App

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
  - [Firebase Setup](#firebase-setup)
  - [Flutter Setup](#flutter-setup)

## Introduction

This Flutter Todo App is a simple yet powerful task management application that allows users to create, read, update, and delete tasks. The app is built using Flutter and Firebase for real-time data synchronization.

Whether you're looking to manage your daily tasks or want to learn more about Flutter and Firebase integration, this app is a great starting point.

## Features

- Create, read, update, and delete tasks.
- Real-time task synchronization across multiple devices.
- Organize tasks with categories or labels.
- Mark tasks as completed.
- Simple and intuitive user interface.

## Requirements

Before you begin, ensure you have met the following requirements:

- Flutter SDK installed (version X.X.X)
- Firebase project created on the Firebase Console ([Firebase Console](https://console.firebase.google.com/))

## Getting Started

### Firebase Setup

1. Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).

2. Add your Flutter app to your Firebase project:
   - Click on "Add App" and select the appropriate platform (iOS/Android/Web).
   - Follow the setup instructions to download the configuration files.
   - Place the configuration files in the appropriate locations in your Flutter project.

3. Set up Firebase Firestore:
   - In the Firebase Console, go to "Firestore Database" and create a new Firestore database.
   - Define the Firestore security rules to restrict access to your database (based on your app's requirements).

### Flutter Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/akshatbhj/todos-app.git

2. Navigate to the project directory:
   
   ```bash
    cd flutter-todo-app

3. Install Flutter dependencies:

   ```bash
    flutter pub get

4. Run the app on your preferred platform (iOS/Android):

   ```bash
   flutter run