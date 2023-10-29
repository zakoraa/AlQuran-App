# Al Qur'an App

An Al Qur'an App with audio and tafsir for each surahs and verses of Al Qur'an.

# Architecture
The architecture used is MVVM, where state management uses Getx. GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

<b>- Getx Installation </b>

Run this command : 

``` $ flutter pub add get ```

<b>- Getx Documentation : </b>

```https://pub.dev/packages/get```


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

<b>- Documentation : </b>

``` https://pub.dev/packages/audioplayers ```

# Screenshots

<img src= "https://github.com/zakoraa/AlQuran-App/assets/129678009/17ea56d5-e0da-4f70-8e38-9ed676073aba"  height = "450" width = "220"/>
<img src= "https://github.com/zakoraa/AlQuran-App/assets/129678009/37b98d7d-3829-4fe9-85bd-3799407570b2"  height = "450" width = "220"/>
<img src= "https://github.com/zakoraa/AlQuran-App/assets/129678009/b791f3c0-7a8b-491a-a86c-4a26bb94cddc"  height = "450" width = "220"/>

