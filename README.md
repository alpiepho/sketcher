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
- [ ] boxes for parts
- [ ] tbd
- [ ] tbd
- [ ] cleanup code



## REFERENCES
- https://docs.flutter.dev
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- https://learn.adafruit.com/sketch-drawing-toy/overview

