# sketcher

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
- [x] text android simulator - sizes?
- [x] text chrome - sizes?
- [ ] host as web on gh-page
- [ ] deploy to android
- [ ] deploy to ios
- [ ] fix broken line of marks
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


