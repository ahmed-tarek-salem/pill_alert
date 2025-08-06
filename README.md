# Pill Alert

Pill Alert is a cross-platform medication reminder application built with Flutter that helps users manage their medication schedules effectively. The app provides an intuitive interface for setting up medication reminders and accessing important medication information.

## Features

- **Medication Management**: Add and track multiple medications
- **Custom Alarm System**: Set personalized reminder times for each medication
- **Multilingual Support**: Available in both English and Arabic
- **Educational Content**: Includes educational videos about medications
- **User-Friendly Interface**: Clean and intuitive design with a modern Material 3 UI
- **Cross-Platform**: Works on iOS and Android devices

## Technologies Used

### Core Framework and Languages
- Flutter (SDK ^3.5.3)
- Dart
- Material Design 3

### Key Dependencies
- **alarm** (^4.1.1): Handles medication reminder alarms
- **hive** (^2.2.3) & **hive_flutter** (^1.1.0): Local data storage
- **permission_handler** (^11.3.1): Manages system permissions
- **youtube_player_flutter** (9.0.3): Displays educational videos
- **flutter_localizations**: Handles app internationalization
- **timezone** (^0.10.0): Manages timezone-specific operations

### Development Dependencies
- **flutter_launcher_icons** (^0.14.2): Customizes app icons
- **flutter_lints** (^4.0.0): Maintains code quality

## Project Structure

```
lib/
├── main.dart           # Application entry point
├── generated/         # Generated localization files
├── l10n/             # Localization resources
│   ├── intl_ar.arb   # Arabic translations
│   ├── intl_en.arb   # English translations
└── src/
    ├── core/         # Core utilities and constants
    └── features/     # Feature modules
        ├── home/     # Home screen functionality
        ├── medicine/ # Medicine management
        └── search/   # Search functionality

assets/
├── audios/          # Audio files for alarms
├── icons/           # Application icons
└── images/          # Image assets
```

## App Architecture

The application follows a feature-first architecture with clean separation of concerns:

1. **Core Layer**: Contains shared utilities, constants, and base configurations
2. **Feature Modules**: Separate modules for different app features (home, medicine, search)
3. **Presentation Layer**: UI components and state management
4. **Service Layer**: Business logic and data management

## Localization

The app supports multiple languages through Flutter's localization system:
- Arabic (default)
- English

## Local Storage

Medication data and user preferences are stored locally using Hive, a lightweight and fast key-value database.

## Installation

1. Ensure Flutter is installed and configured properly
2. Clone the repository
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```


