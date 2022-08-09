import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Speed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                  showAxisLine: false,
                  ticksPosition: ElementsPosition.outside,
                  labelsPosition: ElementsPosition.outside,
                  radiusFactor: 0.9,
                  canRotateLabels: true,
                  showLastLabel: true,
                  majorTickStyle: const MajorTickStyle(
                    color: Colors.white,
                    length: 0.1,
                    lengthUnit: GaugeSizeUnit.factor,
                  ),
                  minorTickStyle: const MinorTickStyle(
                    color: Colors.white,
                    length: 0.04,
                    lengthUnit: GaugeSizeUnit.factor,
                  ),
                  labelFormat: '{value} Mbps',
                  minorTicksPerInterval: 5,
                  interval: 10,
                  axisLabelStyle: const GaugeTextStyle(color: Colors.white),
                  useRangeColorForAxis: true,
                  pointers: const <GaugePointer>[
                    NeedlePointer(
                        enableAnimation: true,
                        value: 70,
                        tailStyle: TailStyle(length: 0.2, width: 5),
                        needleEndWidth: 5,
                        needleLength: 0.7,
                        needleColor: Color.fromARGB(255, 92, 105, 109),
                        knobStyle: KnobStyle(
                            color: Color(0xFF289AB1), borderColor: Colors.blue))
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 100,
                        startWidth: 0.2, //model.isWebFullView ? 0.2 : 0.05,
                        gradient: const SweepGradient(colors: <Color>[
                          Color(0xFF289AB1),
                          Color(0xFF43E695)
                        ], stops: <double>[
                          0.25,
                          0.75
                        ]),
                        color: const Color(0xFF289AB1),
                        rangeOffset: 0.08,
                        endWidth: 0.2,
                        sizeUnit: GaugeSizeUnit.factor)
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
