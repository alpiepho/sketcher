import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sketcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double drawWidth = width * 0.9;
    double drawHeight = height * 0.5;
    double padWidth = width * 0.46;
    // double padHeight = height * 0.3;
    double padHeight = height * 0.2; // TODO undo this.
    double switchWidth = width * 0.04;
    double switchHeight = height * 0.1;
    double buttonWidth = width * 0.10;
    double buttonHeight = height * 0.10;

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
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              // child: const Text("TEST"),
            ),
            // row of controls
            Row(
              children: [
                // left/up-down pad
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: padWidth,
                  height: padHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                  ),
                ),

                // pen up-down button
                Container(
                  width: switchWidth,
                  height: switchHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                  ),
                ),

                // right left-right pad
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: padWidth,
                  height: padHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
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
                border: Border.all(color: Colors.blueAccent),
              ),
            ),

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.question_mark_sharp),
      ),
    );
  }
}
