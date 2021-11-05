# Lembretes

Lembretes is a Flutter project where you can save and see your reminders.

This app has **2 pages**: 
* **Actual / Future reminders** - here you will see all your actual and future reminders and it is also possible
  to create new ones
* **Past reminders** - has the past reminders

Once you enter in the app it will be shown the **Actual / Future reminders** page.
The actual reminders (the reminders of the day) are on the Actual / Future reminders and in the next day the
reminders are shown on the Past reminders page.

## Getting Started

This project is a starting point for a Flutter application.

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Localization

This project generates localized messages based on arb files found in
the `lib/localization` directory.

Right now, the languages used are the english and the portuguese.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

## Theme

This app has a light and a dark theme.

## State Management

In order to manage the state inside this app is used the [Provider](https://pub.dev/packages/provider).

## Data Base

To save the reminders, it was used [SQLite](https://pub.dev/packages/sqflite).
