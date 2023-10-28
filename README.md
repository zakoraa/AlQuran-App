# Al Qur'an App

An Al Qur'an App with audio and tafsir for each surahs and verses of Al Qur'an.

# Architecture
The architecture used is MVVM, where state management uses Getx. GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

# Folder Structure :
```
model      : the core data flow in architecture

repository : contains files that connect the App with the API

theme      : to set the App theme

util       : helpers that can be used in various parts of the App

view       : contains App pages

viewModel  : to organize App logic and logic to obtain APIs

widget     : for custom widgets and reusable widgets
```

# Audio Players
audioplayers is a Flutter plugin to play multiple simultaneously audio files, works for Android, iOS, Linux, macOS, Windows, and web.

<b> - Installation</b>

Run this command : 

``` $ flutter pub add audioplayers ```

<b>- Getting Started</b>

```
import 'package:audioplayers/audioplayers.dart';
// ...
final player = AudioPlayer();
await player.play(UrlSource('https://example.com/my-audio.wav'));
```

# Screenshots

