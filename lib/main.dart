

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TN Sketcher',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'TN Sketcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _version = "Version 0.2";
  final Uri _url = Uri.parse('https://github.com/alpiepho/sketcher');
  bool upDown = true;
  double cursorPosX = -1;
  double cursorPosY = -1;
  double startLeftHori = -1;
  double startLeftVert = -1;
  double startRightHori = -1;
  double startRightVert = -1;
  List<Widget> marks = <Widget>[];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (width > 600) {
      width = 600;
    }
    double drawWidth = width * 0.9;
    double drawHeight = height * 0.4;
    double padWidth = width * 0.4;
    double padHeight = height * 0.3;
    double switchWidth = width * 0.04;
    double switchHeight = height * 0.1;
    double buttonWidth = width * 0.08;
    double buttonHeight = height * 0.06;
    double markSize = 4;
    double markPad = 1;
    double cursorSize = 6;
    double cursorPad = 2;
    double cursorRatio = 0.01;

    // bigger to get screenshot
    markSize *= 2;
    cursorSize *= 2;

    if (defaultTargetPlatform == TargetPlatform.android) {
      buttonWidth *= 2;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      buttonWidth *= 2;
    }

    if (cursorPosX == -1 && cursorPosY == -1) {
      cursorPosX = drawWidth / 2;
      cursorPosY = drawHeight / 2;
    }

    if (upDown) {
        marks.add(
          Positioned(
            left: cursorPosX,
            top: cursorPosY,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                markPad,
                markPad,
                markPad,
                markPad,
              ),
              child: Icon(
                size: markSize,
                color: Colors.white,
                Icons.square,
              ),
            ),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // drawing area
            Container(
              // color: Colors.white,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: drawWidth,
              height: drawHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              // drawing
              child: Stack(children: [
                // marks
                ...marks,
                // cursor
                Positioned(
                  left: cursorPosX,
                  top: cursorPosY,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      cursorPad,
                      cursorPad,
                      cursorPad,
                      cursorPad,
                    ),
                    color: (upDown ? Colors.green : Colors.red),
                    child: Icon(
                      size: cursorSize,
                      color: Colors.black,
                      Icons.square,
                    ),
                  ),
                ),
              ]),
            ),
            // row of controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // left/up-down pad
                GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      startLeftVert = -1;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      if (startLeftVert == -1) {
                        startLeftVert = details.globalPosition.dy;
                        startLeftHori = details.globalPosition.dx;
                       }
                      var topVal = details.globalPosition.dy - startLeftVert;
                      var leftVal = details.globalPosition.dx - startLeftHori;
                      var dist = sqrt(pow(topVal, 2) + pow(leftVal, 2));
                      if (topVal < 0) {
                        dist *= -1;
                      }
                      dist *= cursorRatio;
                      topVal *= cursorRatio;
                      cursorPosY += dist;
                      if (cursorPosY < 0) {
                        cursorPosY = 0;
                      }
                      if (cursorPosY > (drawHeight - cursorSize * 2)) {
                        cursorPosY = (drawHeight - cursorSize * 2);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                    width: padWidth,
                    height: padHeight,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // pen up-down button
                SizedBox(
                  width: switchWidth,
                  height: switchHeight,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Switch.adaptive(
                      applyCupertinoTheme: false,
                      value: upDown,
                      inactiveTrackColor: Colors.red,
                      activeColor: Colors.green,
                      onChanged: (bool value) {
                        setState(() {
                          upDown = value;
                        });
                      },
                    ),
                  ),
                ),

                // right left-right pad
                GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      startRightVert = -1;
                      startRightHori = -1;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      if (startRightHori == -1) {
                        startRightVert = details.globalPosition.dy;
                        startRightHori = details.globalPosition.dx;
                      }
                      var topVal = details.globalPosition.dy - startRightVert;
                      var leftVal = details.globalPosition.dx - startRightHori;
                      var dist = sqrt(pow(topVal, 2) + pow(leftVal, 2));
                      if (leftVal < 0) {
                        dist *= -1;
                      }
                      dist *= cursorRatio;
                      cursorPosX += dist;
                      if (cursorPosX < 0) {
                        cursorPosX = 0;
                      }
                      if (cursorPosX > (drawWidth - cursorSize * 2)) {
                        cursorPosX = (drawWidth - cursorSize * 2);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 10, 0),
                    width: padWidth,
                    height: padHeight,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),

            // clear button
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: FloatingActionButton(
                onPressed: _clearDrawing,
                tooltip: 'Clear',
                backgroundColor: Colors.redAccent,
                child: const Text("CLR"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _aboutDialog,
        tooltip: 'About...',
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.question_mark_sharp),
      ),
    );
  }

  void _aboutDialog() {
    // NOTE: showAboutDialog does not allow easy color changes
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.red,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          child: AboutDialog(children: [
            Text("$_version"),
            const Text("(based on Sketch Drawing Toy with CircuitPython)"),
            ElevatedButton(
              onPressed: _launchUrl,
              child: Text(_url.toString()),
            ),
          ]),
        );
      },
    );
  }

  Future<void> _launchUrl() async {
    // dont need await
    launchUrl(_url);
  }

  void _clearDrawing() {
    setState(() {
      cursorPosX = -1;
      cursorPosY = -1;
      upDown = true;
      marks = <Widget>[];
    });
  }
}
