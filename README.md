# 🚀 Project Setup Guide

This guide helps you set up your Flutter project using **Mason CLI** and apply a modern structure with bricks, dependencies, and flavors.

---

## 🔧 Installation

### 1️⃣ Install Mason CLI

```sh
dart pub global activate mason_cli
```

### 2️⃣ Initialize Mason in Project

```shell
mkdir mason
cd mason
mason init
```

## 🧱 Add Bricks
### Edit mason.yaml and replace the paths with your actual brick locations:


```yaml
bricks:
  i18n:
    path: D:/projects/bricks/i18n (replace with real path)
  readme:
    path: D:/projects/bricks/readme (replace with real path)
  assets:
    path: D:/projects/bricks/assets (replace with real path)
  core:
    path: D:/projects/bricks/core (replace with real path)
  feature:
    path: D:/projects/bricks/feature (replace with real path)
```

### 📦 Fetch bricks

```shell
mason get
```

## 📚 Dependencies

Below is a list of default dependencies used in this project:


| Category                    | Package                                                                                                                                                                                                                                                                                         | Purpose                                                                                                   |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| 🎨 UI & Animations          | `animate_do`<br>`shimmer_animation`<br>`loading_animation_widget`<br>`carousel_slider`<br>`flutter_screenutil`<br>`smooth_page_indicator`<br>`flutter_staggered_animations`<br>`timeline_tile`                                                                                                  | Animations, responsive UI, indicators, timelines                                                          |
| 🖼️ Media & Graphics        | `cached_network_image`<br>`flutter_svg`<br>`flutter_svg_provider`<br>`photo_view`<br>`image_picker`<br>`mime`                                                                                                                                                                                   | Image loading, SVG rendering, zoom, picker                                                                |
| 🌍 Localization             | `easy_localization`                                                                                                                                                                                                                                                                             | Multi-language support                                                                                    |
| ⚡ State Management          | `flutter_bloc`<br>`equatable`<br>`dartz`                                                                                                                                                                                                                                                        | Bloc/Cubit, equality, functional helpers                                                                  |
| 🌐 Networking & APIs        | `dio`<br>`pretty_dio_logger`<br>`http`<br>`http_parser`                                                                                                                                                                                                                                         | HTTP client, interceptors, parsers                                                                        |
| 🔥 Firebase & Notifications | `firebase_core`<br>`firebase_messaging`<br>`flutter_local_notifications`                                                                                                                                                                                                                        | Firebase services & push notifications                                                                    |
| 📍 Location & Maps          | `location`<br>`geocoding`<br>`google_maps_flutter`                                                                                                                                                                                                                                              | GPS, geocoding, maps                                                                                      |
| 📡 Real-time                | `pusher_channels_flutter`                                                                                                                                                                                                                                                                       | Real-time events                                                                                          |
| 💾 Storage & Database       | `hive`<br>`hive_flutter`                                                                                                                                                                                                                                                                        | Local storage                                                                                             |
| 🌐 Web & Browser            | `webview_flutter`<br>`webview_flutter_android`<br>`webview_flutter_wkwebview`                                                                                                                                                                                                                   | WebView support                                                                                           |
| 🛠️ Utilities & Helpers     | `get_it`<br>`uuid`<br>`path`<br>`path_provider`<br>`crypto`<br>`connectivity_plus`<br>`internet_connection_checker_plus`<br>`country_picker`<br>`custom_timer`<br>`timeago`<br>`url_launcher`<br>`bot_toast`<br>`rename`<br>`change_app_package_name`<br>`flutter_widget_from_html`<br>`pinput` | Dependency injection, UUID, file utils, crypto, network, pickers, timers, URL launching, toasts, renaming |



### ⚡ Generate with Mason

### 🎯 Core Project Template

```shell
mason make core -o .././lib
```

### 🧩 Add New Feature (enter feature name)

```shell
mason make feature -o .././lib/features
```

### 🌍 Generate i18n

```shell
mason make i18n -o ../i18n
```

### 🖼️ Generate Assets Folder

```shell
mason make assets -o ../assets
```

### 📄 Generate README

```shell
mason make readme -o ../
```

### 🖋️ Add Assets & Fonts
## in pubspec.yaml file :

```yaml
assets:
  - i18n/
  - assets/
  - assets/global_icon/
  - assets/images/
  - assets/svg/

fonts:
  - family: fontName
    fonts:
      - asset: assets/fonts/fontName/fontName-Light.ttf
        weight: 300
      - asset: assets/fonts/fontName/fontName-Regular.ttf
        weight: 400
      - asset: assets/fonts/fontName/fontName-Medium.ttf
        weight: 500
      - asset: assets/fonts/fontName/fontName-Bold.ttf
        weight: 600

flutter_assets:
  assets_path: assets/
  output_path: lib/core/images/
  filename: app_images.dart
  classname: AppImages
```

### clear mason cache

```shell
mason cache clear
```

## create android flavors

### add this to android/app/build.gradle.

```shell
  flavorDimensions += "default"

  productFlavors {
      create("development") {
          dimension = "default"
          resValue(type = "string", name = "app_name", value = "your app name")
          applicationIdSuffix = ".dev"
      }
      create("production") {
          dimension = "default"
          resValue(type = "string", name = "app_name", value = "your app name")
      }
```

### change label in AndroidManifest.xml

```shell
android:label="@string/app_name"
```

### generate launch file (vscode configuration)

```shell
mason make launch -o ../.vscode
```
