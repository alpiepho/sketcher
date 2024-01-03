# tn_sketcher

A Flutter application that implements a Sketcher toy, based on [Sketch Drawing Toy with CircuitPython](https://learn.adafruit.com/sketch-drawing-toy/overview).

## Rough Notes

```text
title: Sketch
-----------------------------------------
| 0,0                                   |
|                                       |
|                                       |
|                                       |
|                  . . . . .            |
|                          .            |
|                          x            |
|                                       |
|                                       |
|                                  99,99|
-----------------------------------------

                   pen
-----------------   O  ------------------
|               |   X  |                |
|   drag        |      |    drag        |
|   <-->        |      |     ^          |
|               |      |     |          |
|               |      |     v          |
-----------------      ------------------

                 -----               
                 |clr|              / + \
                 -----              \   /

```

## Steps for GH Page Release

- flutter build web --base-href /tn_sketcher/
- cp -rf build/web/* docs/

## TODO

- [x] start README.md
- [x] outline screen
- [x] boxes for parts
- [x] about modal
- [x] fix hyperlink from about
- [x] fix colors of about - better, messy
- [x] remove sample counter
- [x] pen red/green
- [x] marks white
- [x] pen switch - screen
- [x] pen switch - operation
- [x] clear button - screen
- [x] clear button - operation
- [x] pad icons - screen
- [x] pad gestures - operation
- [x] cleanup code
- [x] cleanup about details
- [x] add version to about
- [x] test ios simulator - sizes?
- [x] test android simulator - sizes?
- [x] test chrome - sizes?
- [x] test on android device
- [-] test on iphone (problems signing up, dont like how dev mode on phone, maybe later)
- [x] favicon
- [ ] pubspec
- [x] host as web on gh-page
- [ ] fix touch pad speed
- [-] deploy to android
- [-] deploy to ios
- [ ] as PWA (icons)
- [ ] change PWA refresh???
- [ ] refactor long functions
- [ ] fix broken line of marks
- [ ] future: change line stroke size
- [ ] future: touch pad speed
- [ ] future: change colors
- [ ] future: save drawing somehow




## REFERENCES
- https://docs.flutter.dev
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- https://learn.adafruit.com/sketch-drawing-toy/overview
- change AboutDialog style:
- https://www.dhiwise.com/post/how-to-create-and-customize-flutter-alert-dialogs
- Switch:
- https://api.flutter.dev/flutter/widgets/RotatedBox-class.html
- https://api.flutter.dev/flutter/material/Switch-class.html
- Touchpad:
- https://gist.github.com/graphicbeacon/eb7e2ca7b3ff1d674819403789744173

- Run on Android
- https://stackoverflow.com/questions/54444538/how-do-i-run-test-my-flutter-app-on-a-real-device


- Deployment
- https://docs.flutter.dev/deployment
- https://flutterawesome.com/simple-way-to-deploy-a-flutter-web-application-on-github/amp/
- this app: flutter build web --base-href /tn_sketcher/

- https://www.appicon.co/
- https://www.freecodecamp.org/news/build-and-release-flutter-app-in-google-play/
- https://www.instabug.com/blog/how-to-release-your-flutter-app-for-ios-and-android
- https://flutter-website-staging.firebaseapp.com/android-release/

- sample
- https://flutter.github.io/samples/#
- https://github.com/VGVentures/slide_puzzle/tree/release

- Steps to publist Android:
- https://www.youtube.com/watch?v=g0GNuoCOtaQ
- https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=android&foreground.space.trim=1&foreground.space.pad=0.25&foreColor=rgba(96%2C%20125%2C%20139%2C%200)&backColor=rgb(68%2C%20138%2C%20255)&crop=0&backgroundShape=circle&effects=none&name=ic_launcher

