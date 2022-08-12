import 'package:flutter/material.dart';
import 'theme_data.dart';
import 'views/home_screen.dart';

import 'package:flutter_speedtest/flutter_speedtest.dart';

void main() {
  runApp(MyApp());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Speed',
      theme: appThemeData,
      home: const HomeScreen(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double downloadRate = 0;
  double uploadRate = 0;

  final _speedtest = FlutterSpeedtest(
    baseUrl: 'http://speedtest.jaosing.com:8080', // your server url
    pathDownload: '/download',
    pathUpload: '/upload',
    pathResponseTime: '/ping',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Download: $downloadRate'),
              Text('Upload: $uploadRate'),
              Row(
                children: [
                  TextButton(
                      onPressed: () async {
                        _speedtest.getDataspeedtest(
                          downloadOnProgress: ((percent, transferRate) {
                            setState(() {
                              downloadRate = percent;
                            });
                          }),
                          uploadOnProgress: ((percent, transferRate) {
                            setState(() {
                              uploadRate = percent;
                            });
                          }),
                          progressResponse: ((responseTime, jitter) {
                            //TODO: in ui
                          }),
                          onError: ((errorMessage) {
                            //TODO: in ui
                          }),
                        );
                      },
                      child: Text('Test '))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
