import 'dart:async';

import 'package:acelerometer/entities/singleton_cronometer.dart';
import 'package:intl/intl.dart';

class CheckSensor{

  SingletonCronometer sinCronometer = SingletonCronometer();

  bool isUserWorking(List<double> listSensor){
    bool stateX = false;
    bool stateY = false;
    bool stateZ = false;

    if(listSensor != null){
      if(-0.3 < listSensor[0] && listSensor[0]< 0.3 ){
        stateX = true;
      }
      if(-0.3 < listSensor[1] && listSensor[1]< 0.3 ){
        stateY = true;
      }
      if(-0.3 < listSensor[2] && listSensor[2]< 0.3 ){
        stateZ = true;
      }
      late bool isWorking;

      if(stateX && stateY && stateZ){
        isWorking = true;
        print("You are not working");

        if(!sinCronometer.isRunning){
          sinCronometer.start(); 
        }  

        return isWorking;
      }else{
        isWorking =  false;
        print("You are working");

        if(sinCronometer.isRunning){
          sinCronometer.stop();
        }

        return isWorking;
      }
    }else{
      return false;
    }
  }

}