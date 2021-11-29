import 'dart:async';


import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';


class AccelerometerFunction extends ChangeNotifier{


  late List<String>? accelerometer = null;

  List<String>? isWorking(){

    List<double>? dataAcelerometer;

    userAccelerometerEvents.listen((event) {
      (UserAccelerometerEvent event){
        notifyListeners();
        dataAcelerometer = <double>[event.x, event.y, event.z];
      };
    });

    final accelerometer = dataAcelerometer?.map((double v) => v.toStringAsFixed(1)).toList();
    
    return accelerometer;
  }

}