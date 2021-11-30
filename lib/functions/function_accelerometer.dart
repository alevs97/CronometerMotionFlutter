import 'dart:async';

import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FunctionAccelerometer{

  List<double> _accelerometerList = [];
  final _accelerometerStream = StreamController<List<double>>();

  Stream<List<double>> listenDataSensors(){
    userAccelerometerEvents.listen((event) {
        _accelerometerList = <double> [event.x,event.y,event.z];
        if(!_accelerometerStream.isClosed){
          _accelerometerStream.sink.add(_accelerometerList);
        }
   });
   return _accelerometerStream.stream;
  }

  void dispose(){
    _accelerometerStream.close();
  }


}