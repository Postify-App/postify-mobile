# 🚀 Project Setup Guide

This guide helps you set up your Flutter project using **Mason CLI** and apply a modern structure with bricks, dependencies, and flavors.

---

## 🔧 Installation

### 1️⃣ Install Mason CLI

```sh
dart pub global activate mason_cli
2️⃣ Initialize Mason in Project
mkdir mason
cd mason
mason init
🧱 Add Bricks
Edit mason.yaml and replace the paths with your actual brick locations:
bricks:
  i18n:
    path: D:/projects/bricks/i18n
  readme:
    path: D:/projects/bricks/readme
  assets:
    path: D:/projects/bricks/assets
  core:
    path: D:/projects/bricks/core
  feature:
    path: D:/projects/bricks/feature
📦 Fetch bricks
mason get
📚 Dependencies
Here’s a curated list of default dependencies for the project:
Category	Package	Purpose
🎨 UI & Animations	animate_do
shimmer_animation
loading_animation_widget
carousel_slider
flutter_screenutil
smooth_page_indicator
flutter_staggered_animations
timeline_tile	Animations, responsive UI, indicators, timelines
🖼️ Media & Graphics	cached_network_image
flutter_svg
flutter_svg_provider
photo_view
image_picker
mime	Image loading, SVG rendering, zoom, picker
🌍 Localization	easy_localization	Multi-language support
⚡ State Management	flutter_bloc
equatable
dartz	Bloc/Cubit, equality, functional helpers
🌐 Networking & APIs	dio
pretty_dio_logger
http
http_parser	HTTP client, interceptors, parsers
🔥 Firebase & Notifications	firebase_core
firebase_messaging
flutter_local_notifications	Firebase services & push notifications
📍 Location & Maps	location
geocoding
google_maps_flutter	GPS, geocoding, maps
📡 Real-time	pusher_channels_flutter	Real-time events
💾 Storage & Database	hive
hive_flutter	Local storage
🌐 Web & Browser	webview_flutter
webview_flutter_android
webview_flutter_wkwebview	WebView support
🛠️ Utilities & Helpers	get_it
uuid
path
path_provider
crypto
connectivity_plus
internet_connection_checker_plus
country_picker
custom_timer
timeago
url_launcher
bot_toast
rename
change_app_package_name
flutter_widget_from_html
pinput	Dependency injection, UUID, file utils, crypto, network, pickers, timers, URL launching, toasts, renaming
⚡ Generate with Mason
🎯 Core Project Template
mason make core -o .././lib
🧩 Add New Feature
mason make feature -o .././lib/features
🌍 Generate i18n
mason make i18n -o ../i18n
🖼️ Generate Assets Folder
mason make assets -o ../assets
📄 Generate README
mason make readme -o ../
🖋️ Add Assets & Fonts
In your pubspec.yaml:
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
💡 Generate assets class with:
flutter_assets:
  assets_path: assets/
  output_path: lib/core/images/
  filename: app_images.dart
  classname: AppImages
🧹 Mason Cache
mason cache clear
📱 Android Flavors
In android/app/build.gradle:
flavorDimensions += "default"

productFlavors {
    create("development") {
        dimension = "default"
        resValue("string", "app_name", "Your App Dev")
        applicationIdSuffix = ".dev"
    }
    create("production") {
        dimension = "default"
        resValue("string", "app_name", "Your App")
    }
}
🔖 Update AndroidManifest.xml:
android:label="@string/app_name"
⚙️ VSCode Launch Config
mason make launch -o ../.vscode
✨ Tips
🔄 Run flutter clean + mason cache clear if something feels off.
🧩 Keep features modular → each new feature gets its own folder.
🌍 Use easy_localization for translation consistency.
🎨 Apply flutter_screenutil for responsive design across devices.
```
