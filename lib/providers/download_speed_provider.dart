import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speedtest/flutter_speedtest.dart';

final downloadSpeedProvider =
    ChangeNotifierProvider<DownloadSpeedNotifier>((ref) {
  return DownloadSpeedNotifier();
});

class DownloadSpeedNotifier extends ChangeNotifier {
  double _downloadSpeed = 0;
  double get downloadSpeed => _downloadSpeed;
  //Setup speedtest
  final _speedtest = FlutterSpeedtest(
    baseUrl: 'http://speedtest.jaosing.com:8080', // your server url
    pathDownload: '/download',
    pathUpload: '/upload',
    pathResponseTime: '/ping',
  );

  Future<void> getDownSpeed() async {
    double downloadRate = 0;
    await _speedtest.getDataspeedtest(
      downloadOnProgress: ((percent, transferRate) {
        _downloadSpeed = percent;
      }),
      uploadOnProgress: ((p, tr) {}),
      progressResponse: ((r, j) {}),
      onError: ((e) {}),
    );
  }
}
