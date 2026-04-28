
# Qerp App 🕒

A professional Flutter application for managing work schedules and attendance, built with Clean Architecture and Cubit. It features  shift tracking, multi-language support, and a responsive UI.


[![Flutter Version](https://img.shields.io/badge/Flutter-3.41.4-blue)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-Latest-blue)](https://dart.dev/)



## Table of Contents
- [Features](#features)
- [Technical Architecture](#technical-architecture)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Localization](#localization)


## Features

### 1. Work Schedule
- Dual-View Visualization: Offers two dynamic modes to track work schedules:

1. Interactive Calendar: Provides a monthly overview of assigned shifts, allowing users to visualize their work cycle at a glance.
2. Attendance Chronology: A detailed, scrollable list view displaying daily attendance records, including precise check-in/check-out timestamps and shift durations.

### 2. Profile & Settings

- Multi-language support (Arabic/English) with instant UI updates.
- Theme switching support (Light/Dark mode).

## Technical Architecture
The app follows **Clean Architecture** principles, ensuring a separation of concerns between:
- **Data Layer:** Handles API calls (Dio) and Data Models.
- **Domain Layer:** Contains Business Logic (Entities & Use Cases).
- **Presentation Layer:** UI components and State Management using **Cubit (BLoC)**.

## Tech Stack

| Component          | Packages & Tools                                         
|--------------------|---------------------------------------------------------
| **State Management**| flutter_bloc, equatable, dartz, get_it (Service Locator)       
| **Networking** | Dio, Pretty Dio Logger                                  
| **Responsive UI** | flutter_screenutil                                      
| **Storage** | Hive (Local DB), hive_flutter, path_provider,                     
| **UI Components** | Shimmer, Custom Clippers, Google Fonts,flutter_svg,                  


## Project Structure
lib/
├── main.dart
├── core/
│   ├── config/
│   │   ├── app_colors.dart
│   │   ├── app_endpoints.dart
│   │   ├── app_icons.dart
│   │   ├── env_keys.dart
│   │   └── style/
│   │       ├── font_utils.dart
│   │       └── styles.dart
│   ├── enum/
│   │   └── shifts_enum.dart
│   ├── extentions/
│   │   ├── context_helper.dart
│   │   ├── env.dart
│   │   └── localization.dart
│   ├── injection/
│   │   └── injection_container.dart
│   ├── methods/
│   │   ├── convet_date_time.dart
│   │   └── shifts_method.dart
│   ├── navigator/
│   │   ├── app_navigator.dart
│   │   └── inj_navigator.dart
│   ├── network/
│   │   ├── network_service_inj.dart
│   │   └── network_service/
│   │       ├── api_base_helper.dart
│   │       ├── api_errors.dart
│   │       ├── api_response.dart
│   │       ├── error_helper.dart
│   │       ├── exceptions.dart
│   │       ├── failure.dart
│   │       └── repository_helper.dart
│   ├── storage/
│   │   ├── storage.dart
│   │   ├── storage_impl.dart
│   │   └── storage_inj.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── app_theme_data.dart
│   ├── translation/
│   │   ├── app_localizations.dart
│   │   ├── app_localizations_ar.dart
│   │   └── app_localizations_en.dart
│   └── widgets/
│       ├── app_button.dart
│       ├── app_chip.dart
│       ├── app_error_message.dart
│       ├── app_shimmer.dart
│       ├── app_switch.dart
│       ├── circle_container.dart
│       ├── custom_popup.dart
│       └── shimmer_shape.dart
└── features/
    ├── layout_screen/
    │   ├── layout_inj.dart
    │   └── view/
    │       ├── cubit/
    │       │   ├── bnb_cubit.dart
    │       │   └── bnb_state.dart
    │       ├── screen/
    │       │   └── layout_screen.dart
    │       └── widgets/
    │           └── bnb_icon.dart
    ├── profile_screen/
    │   └── view/
    │       ├── cubit/ (empty)
    │       ├── screen/
    │       │   └── profile_screen.dart
    │       └── widget/
    │           ├── custom_radio_circle.dart
    │           ├── general_setting_item.dart
    │           ├── language_item.dart
    │           ├── preferences_item.dart
    │           ├── select_language_bottom_sheet.dart
    │           ├── select_lang_item.dart
    │           └── settings_item.dart
    └── work_schedule_screen/
        ├── work_schedule_inj.dart
        ├── data/
        │   ├── datasource/
        │   │   └── work_schedule_datasource.dart
        │   ├── model/
        │   │   ├── attendance_model.dart
        │   │   ├── calendar_model.dart
        │   │   ├── shift_model.dart
        │   │   └── work_schedule_calendar_model.dart
        │   └── repository/
        │       └── work_schedule_repository_impl.dart
        ├── domain/
        │   ├── entity/
        │   │   ├── attendance_entity.dart
        │   │   ├── calendar_entity.dart
        │   │   ├── shift_entity.dart
        │   │   └── work_scedule_calendar_entity.dart
        │   ├── repository/
        │   │   └── work_scedule_repository.dart
        │   └── usecases/
        │       ├── get_attendance_list_usecas.dart
        │       └── get_calendar_usecase.dart
        └── view/
            ├── cubit/
            │   ├── work_schedule_cubit.dart
            │   └── work_schedule_state.dart
            ├── screens/
            │   ├── attendance_list_screen.dart
            │   ├── calendar_screen.dart
            │   └── work_schedule_screen.dart
            └── widgets/
                ├── attendance_item.dart
                ├── attendance_loading_item.dart
                ├── calendar_day_item.dart
                ├── calendar_header.dart
                ├── calendar_table.dart
                ├── custom_calendar_table.dart
                ├── empty_calendar_item.dart
                ├── loading_calendar_item.dart
                ├── schedule_toggle_bar.dart
                ├── shifts_grid_list.dart
                ├── shift_item.dart
                └── work_time_item.dart

# core:Global shared components and configurations
# config: App constants, themes, and API endpoints
# network: Remote data handling & Error management (Dio/API)
# injection: Dependency Injection setup (GetIt)
# Storage: Local data storage implementation
# widgets: Reusable UI components used across the app
# features: Business logic and UI grouped by feature
# workScheduleScreen: Implements Clean Architecture (Data, Domain, Presentation) to fetch work schedule attendance and calendar
# layoutScreen: App main navigation and layout management
# profileScreen: User settings and localization preferences


## Getting Started

1. Clone the repository:
 ```sh
   git clone https://github.com/HamdiMohamed2000/Qerp-App.git
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```   

3. Run the project:

   ```sh
   flutter run
   ```   
## Localization

Supports multiple languages using the `intl` package with:

- English (en)
- Arabic (ar)

