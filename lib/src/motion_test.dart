import 'package:acelerometer/functions/function_accelerometer.dart';
import 'package:acelerometer/entities/singleton_cronometer.dart';
import 'package:acelerometer/functions/check_sensor.dart';
import 'package:acelerometer/entities/cronometer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late FunctionAccelerometer functionAccelerometer;
  SingletonCronometer sinCronometer = SingletonCronometer();
  CheckSensor checkSensor = CheckSensor();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      functionAccelerometer = FunctionAccelerometer();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    functionAccelerometer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accelerometer"),
      ),
      body: StreamBuilder<List<double>>(
        stream: functionAccelerometer.listenDataSensors(),
        builder: (BuildContext context, AsyncSnapshot<List<double>> snapshot) { 
  
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          } 

          List<double> data = snapshot.data!;
          
          final userAccelerometer = data.map((double v) => v.toStringAsFixed(1)).toList();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Data accelerometer ${userAccelerometer}"),
              (checkSensor.isUserWorking(data)) ? 
              Text("Not Working"):
              Text("Working"),
              StreamBuilder<String>(
                stream: sinCronometer.chronometerStream,
                initialData: "-:--:--:------",
                builder: ( _ , snapshot){
                  return Text(snapshot.data.toString() + '  inative time');
                }
              ),
            ],
          );
        },
      ),
    );
  }
}