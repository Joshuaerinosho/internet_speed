import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speedtest/flutter_speedtest.dart';

final downloadSpeedProvider =
    StateNotifierProvider<DownloadSpeedNotifier, double>((ref) {
  return DownloadSpeedNotifier();
});

class DownloadSpeedNotifier extends StateNotifier<double> {
  DownloadSpeedNotifier() : super(0);

  //Setup speedtest
  final _speedtest = FlutterSpeedtest(
    baseUrl: 'http://speedtest.jaosing.com:8080', // your server url
    pathDownload: '/download',
    pathUpload: '/upload',
    pathResponseTime: '/ping',
  );

  void increment() => state++;
}
