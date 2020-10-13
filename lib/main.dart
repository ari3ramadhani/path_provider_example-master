import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'path provider Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String textContent =
      'Press the button below to write the file or read from it';
  void _buttonPressed() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    File ourFile = File('$appDocPath/greeting.txt');
    ourFile.writeAsString('Hello, Flutter Buddy');
    setState(() {
      textContent = 'File was written';
    });
    print(appDocDir.listSync());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              textContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buttonPressed,
        tooltip: 'Write file',
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
