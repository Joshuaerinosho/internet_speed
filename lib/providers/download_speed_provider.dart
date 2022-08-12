import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speedtest/flutter_speedtest.dart';

final downloadSpeedProvider =
    ChangeNotifierProvider<DownloadSpeedNotifier>((ref) {
  return DownloadSpeedNotifier();
});

final downloadSpeedUpdateProvider = StreamProvider<double>((ref) {
  return ref.read(downloadSpeedProvider).downSpeedStream();
});

class DownloadSpeedNotifier extends ChangeNotifier {
  //Setup speedtest
  final _speedtest = FlutterSpeedtest(
    baseUrl: 'http://speedtest.jaosing.com:8080', // your server url
    pathDownload: '/download',
    pathUpload: '/upload',
    pathResponseTime: '/ping',
  );

  Future<double> getDownSpeed() async {
    double downloadRate = 0;
    await _speedtest.getDataspeedtest(
      downloadOnProgress: ((percent, transferRate) {
        downloadRate = percent;
      }),
      uploadOnProgress: ((p, tr) {}),
      progressResponse: ((r, j) {}),
      onError: ((e) {}),
    );
    return downloadRate;
  }

  Stream<double> downSpeedStream() => Stream.fromFuture(getDownSpeed());
}
