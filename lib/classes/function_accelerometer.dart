import 'dart:async';

import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FunctionAccelerometer{

  List<double> _accelerometerList = [];
  final _accelerometerStream = StreamController<List<double>>();

  FunctionAccelerometer(){
    print("Inicio de accele");
  }

  Stream<List<double>> listenDataSensors(){

    userAccelerometerEvents.listen((event) {
      (UserAccelerometerEvent event){
        _accelerometerList = <double> [event.x,event.y,event.z];
        print(_accelerometerList[1]);
        if(!_accelerometerStream.isClosed){
          _accelerometerStream.sink.add(_accelerometerList);
        }
      };
   });
   
   return _accelerometerStream.stream;
  }

  void dispose(){
    _accelerometerStream.close();
  }


}