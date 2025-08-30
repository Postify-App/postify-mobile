## Usage

### install maosn cli

```shell
dart pub global activate mason_cli
```

### add mason to your project

```shell
mkdir mason
cd mason
mason init
```

### add bricks to mason.yaml file

- replace paths with the bricks path on your pc

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

### get bricks

```shell
mason get
```

## Dependencies

Below is a list of default dependencies used in this project:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # --- UI & Animations ---
  animate_do: ^3.3.4 # Prebuilt animations (fade, bounce, zoom, etc.)
  shimmer_animation: ^2.2.1 # Shimmer loading placeholders
  loading_animation_widget: ^1.2.1 # Modern animated loading indicators
  smooth_page_indicator: ^1.1.0 # PageView indicators with effects
  flutter_staggered_animations: ^1.1.1 # Masonry-style layout
  carousel_slider: ^5.0.0 # Carousel/slider for images or widgets
  flutter_screenutil: ^5.9.3 # Responsive UI for different screen sizes
  timeline_tile: ^2.0.0 # Easily build timeline widgets

  # --- Media & Graphics ---
  cached_network_image: ^3.3.1 # Load and cache network images
  flutter_svg: ^2.0.10+1 # Render SVG images
  flutter_svg_provider: ^1.0.7 # Use SVG as ImageProvider
  photo_view: ^0.15.0 # Zoomable image viewer
  image_picker: ^1.1.2 # Pick images/videos from camera or gallery
  mime: ^1.0.5 # Detect MIME types

  # --- Localization ---
  easy_localization: ^3.0.7 # Multi-language support

  # --- State Management ---
  flutter_bloc: ^8.1.6 # Bloc/Cubit state management
  equatable: ^2.0.5 # Value-based equality (great for Bloc states)
  dartz: ^0.10.1 # Functional programming helpers (Either, Option, etc.)

  # --- Networking & APIs ---
  dio: ^5.4.3+1 # Powerful HTTP client with interceptors
  pretty_dio_logger: ^1.3.1 # Logging interceptor for Dio
  http: ^1.2.1 # Simple HTTP client
  http_parser: ^4.0.2 # Parse HTTP requests and responses

  # --- Firebase & Notifications ---
  firebase_core: ^3.4.0 # Core Firebase initialization
  firebase_messaging: ^15.1.0 # Firebase Cloud Messaging (push notifications)
  flutter_local_notifications: ^17.2.2 # Local notifications on device

  # --- Location & Maps ---
  location: ^7.0.0 # Get user location via GPS
  geocoding: ^3.0.0 # Convert addresses <-> coordinates
  google_maps_flutter: ^2.9.0 # Google Maps widget

  # --- Real-time & Communication ---
  pusher_channels_flutter: ^2.2.1 # Real-time events with Pusher

  # --- Storage & Database ---
  hive: ^2.2.3 # Lightweight NoSQL database
  hive_flutter: ^1.1.0 # Hive integration for Flutter

  # --- Web & Browser ---
  webview_flutter: ^4.9.0 # Display web pages inside app
  webview_flutter_android: ^3.16.7 # Android implementation of WebView
  webview_flutter_wkwebview: ^3.15.0 # iOS (WKWebView) implementation

  # --- Utilities & Helpers ---
  get_it: ^8.0.1 # Dependency injection / service locator
  uuid: ^4.4.2 # Generate unique IDs
  path: ^1.9.0 # File path utilities
  path_provider: ^2.1.3 # Get system directories (temp, documents, etc.)
  country_picker: ^2.0.26 # Country picker with flags and codes
  custom_timer: ^0.2.3 # Custom countdown/stopwatch timer
  timeago: ^3.6.1 # Human-readable time (e.g., "5 minutes ago")
  crypto: ^3.0.5 # Cryptographic functions (hashing, HMAC, etc.)
  connectivity_plus: ^6.0.3 # Check network connectivity (wifi/mobile)
  internet_connection_checker_plus: ^2.5.2 # Actively check for internet access
  url_launcher: ^6.3.0 # Open URLs, phone calls, emails, etc.
  bot_toast: ^4.1.3 # In-app toast notifications
  rename: ^3.0.2 # Rename project package/bundle identifiers
  change_app_package_name: ^1.3.0 # Change Android package name easily
  cupertino_icons: ^1.0.6 # Default iOS-style icons
  flutter_widget_from_html: ^0.15.1 # Render HTML content as Flutter widgets
  pinput: ^5.0.0 # Beautiful PIN code input widget
```

### generate project template:

```shell
mason make core -o .././lib
```

### add new feature (enter feature name)

```shell
mason make feature -o .././lib/features
```

### generate lang folder

```shell
mason make i18n -o ../i18n
```

### generate assets folder

```shell
mason make assets -o ../assets
```

### generate readme file (enter project name)

```shell
mason make readme -o ../
```

### Add assets and fonts paths in pubspec.yaml file

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
