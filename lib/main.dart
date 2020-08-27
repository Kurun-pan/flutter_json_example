import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_example/model/sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  Samples _samples;

  @override
  void initState() {
    super.initState();
    _jsonFileLoad().then((value) {
      setState(() {
        _samples = value;
        assert(_samples.list.isNotEmpty);
      });
    });
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
          children: _samples == null
              ? List<Widget>()
              : <Widget>[
                  for (int i = 0; i < _samples.list.length; i++)
                    Text(
                      'ID: ${_samples.list[i].id}, NAME: ${_samples.list[i].name}',
                    ),
                ],
        ),
      ),
    );
  }

  Future<dynamic> _jsonFileLoad() async {
    String path = 'assets/sample.json';
    String jsonString;

    try {
      jsonString = await rootBundle.loadString(path);
    } on FlutterError {
      print('Faild to open $path');
      exit(0);
    }

    return Samples.fromJson(jsonDecode(jsonString));
  }
}
