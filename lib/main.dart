import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sketcher',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Sketcher'),
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
  final Uri _url = Uri.parse('https://github.com/alpiepho/sketcher');
  bool upDown = true;
  double cursorPosX = -1;
  double cursorPosY = -1;
  double startHori = -1;
  double startVert = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double drawWidth = width * 0.9;
    double drawHeight = height * 0.5;
    double padWidth = width * 0.44;
    double padHeight = height * 0.3;
    double switchWidth = width * 0.04;
    double switchHeight = height * 0.1;
    double buttonWidth = width * 0.08;
    double buttonHeight = height * 0.06;

    double markrSize = 6;
    double markPad = 1;
    double cursorSize = 6;
    double cursorPad = 2;
    double cursorRatio = 0.05;

    if (cursorPosX == -1 && cursorPosY == -1) {
      cursorPosX = drawWidth / 2;
      cursorPosY = drawHeight / 2;
      print("$cursorPosX");
      print("$cursorPosY");
     }


    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                // // mark
                // Positioned(
                //   left: cursorPosX - 10 - 10 - 10,
                //   top: cursorPosY,
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(
                //       markPad,
                //       markPad,
                //       markPad,
                //       markPad,
                //     ),
                //     child: Icon(
                //       size: markrSize,
                //       color: Colors.white,
                //       Icons.square,
                //     ),
                //   ),
                // ),
                // // mark
                // Positioned(
                //   left: cursorPosX - 10 - 10,
                //   top: cursorPosY,
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(
                //       markPad,
                //       markPad,
                //       markPad,
                //       markPad,
                //     ),
                //     child: Icon(
                //       size: markrSize,
                //       color: Colors.white,
                //       Icons.square,
                //     ),
                //   ),
                // ),
                // // mark
                // Positioned(
                //   left: cursorPosX - 10,
                //   top: cursorPosY,
                //   child: Container(
                //     padding: EdgeInsets.fromLTRB(
                //       markPad,
                //       markPad,
                //       markPad,
                //       markPad,
                //     ),
                //     child: Icon(
                //       size: markrSize,
                //       color: Colors.white,
                //       Icons.square,
                //     ),
                //   ),
                // ),

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
              children: [
                // left/up-down pad
                GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      // startHori = -1;
                      startVert = -1;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                    if (startVert == -1) {
                      startVert = details.globalPosition.dy;
                    }
                    var topVal = details.globalPosition.dy - startVert;
                    topVal *= cursorRatio;
                      cursorPosY += topVal;
                      if (cursorPosY < 0) {
                        cursorPosY = 0;
                      }
                      if (cursorPosY > (drawHeight - cursorSize*2)) {
                        cursorPosY = (drawHeight - cursorSize*2);
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
                      // Don't use the ambient CupertinoThemeData to style this switch.
                      applyCupertinoTheme: false,
                      value: upDown,
                      inactiveTrackColor: Colors.red,
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
                      startHori = -1;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                    if (startHori == -1) {
                      startHori = details.globalPosition.dx;
                    }
                    var leftVal = details.globalPosition.dx - startHori;
                    leftVal *= cursorRatio;
                      cursorPosX += leftVal;
                      if (cursorPosX < 0) {
                        cursorPosX = 0;
                      }
                      if (cursorPosX > (drawWidth - cursorSize*2)) {
                        cursorPosX = (drawWidth - cursorSize*2);
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
                  // border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(100)),
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
    // print("_aboutDialog");

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      // barrierColor: barrierColor,
      // barrierLabel: barrierLabel,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.red,
            // colorScheme: const ColorScheme.dark(),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          child: AboutDialog(
              // applicationName: applicationName,
              // applicationVersion: applicationVersion,
              // applicationIcon: applicationIcon,
              // applicationLegalese: applicationLegalese,
              children: [
                const Text(
                    "Sketcher App: based on Sketch Drawing Toy with CircuitPython."),
                ElevatedButton(
                  onPressed: _launchUrl,
                  child: Text(_url.toString()),
                ),
              ]),
        );
      },
      // routeSettings: routeSettings,
      // anchorPoint: anchorPoint,
    );

    // showAboutDialog(
    //   context: context,
    //   // applicationLegalese:
    //   //     "Sketcher App: based on Sketch Drawing Toy with CircuitPython.",
    //   children: [
    //     const Text(
    //         "Sketcher App: based on Sketch Drawing Toy with CircuitPython."),
    //       ElevatedButton(
    //         onPressed: _launchUrl,
    //         child: Text(_url.toString()),
    //       ),
    //   ],
    // );
    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });
  }

  Future<void> _launchUrl() async {
    launchUrl(_url);
    // if (!await launchUrl(_url)) {
    //   throw Exception('Could not launch $_url');
    // }
  }

  void _clearDrawing() {
    print("_clearDrawwing");
    setState(() {
      upDown = true;
    });
  }
}
