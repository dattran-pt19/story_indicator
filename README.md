# Story Indicator

## Features

* Make automatically run Indicator like facebook story.
* Can combine to the PageView to show banner.
  ![Alt Text](https://images.viblo.asia/7087aa8d-9c94-46ef-af65-c45d0031abea.gif)
## Installing

Add this to your package's `pubspec.yaml` file:

```dart
dependencies:
  story_indicator: ^latest
```

## Import

```dart
import 'package:story_indicator/story_indicator.dart';
```

## Usage

Use like a widget everywhere you want, you can see example in `/example` folder.

```dart
Container(
      padding: const EdgeInsets.all(24),
      child: StoryIndicator(
          itemCount: itemOfOnBoarding,
          currentIndex: currentIndex,
          highlightColor: Colors.red,
          indicatorSpacing: 8,
          interval: const Duration(seconds: 2)
      )
  )
```

## Customize

You can custom some value to change indicator UI
| Variable | Description |
| ------ | ------ |
| itemCount | Set number of indicators |
| currentIndex | Set and get current indicator index |
| interval | Set running interval of indicator |
| highlightColor | Set highlight color of indicator |
| defaultColor | Set default color of indicator |
| indicatorSpacing | Set indicator spacing |


**Trần Đạt, Thank you!**
