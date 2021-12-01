import 'package:acelerometer/entities/cronometer.dart';

class SingletonCronometer extends Chronometer{

  static final  SingletonCronometer _instance = SingletonCronometer._internal();

  factory SingletonCronometer(){
    return _instance;
  }
  
  SingletonCronometer._internal();

}