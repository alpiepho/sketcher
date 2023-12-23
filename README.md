# sketcher

A Flutter application that implements a Sketcher toy, based on [Sketch Drawing Toy with CircuitPython](https://learn.adafruit.com/sketch-drawing-toy/overview).

## Rough Notes

```text
title: Sketch
-----------------------------------------
|                                       |
|                                       |
|                                       |
|                                       |
|                  . . . . .            |
|                          .            |
|                          x            |
|                                       |
|                                       |
|                                       |
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

- black back ground
- red/green square cursor
- outline box for draw area?
- outline box for drag areas?
- floating button as info modal
- (future) floating button as settings
- cleanup code

```

## TODO

- [x] start README.md
- [x] outline screen
- [x] boxes for parts
- [x] about modal
- [x] fix hyperlink from about
- [x] fix colors of about - better, messy
- [x] remove sample counter
- [ ] pen red/green
- [ ] marks white
- [x] pen switch - screen
- [x] pen switch - operation
- [x] clear button - screen
- [?] clear button - operation
- [x] pad icons - screen
- [ ] pad gestures - operation
- [ ] tbd
- [ ] tbd
- [ ] tbd
- [ ] tbd
- [ ] tbd
- [ ] cleanup code
- [ ] cleanup about details



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


