import 'package:acelerometer/classes/function_accelerometer.dart';
import 'package:flutter/material.dart';


class MotionTest extends StatefulWidget {
  MotionTest({Key? key}) : super(key: key);

  @override
  _MotionTestState createState() => _MotionTestState();
}

class _MotionTestState extends State<MotionTest> {

  late FunctionAccelerometer functionAccelerometer;

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
    //functionAccelerometer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accelerometer 2"),
      ),
      body: StreamBuilder<List<double>>(
        stream: functionAccelerometer.listenDataSensors(),
        builder: (BuildContext context, AsyncSnapshot<List<double>> snapshot) { 
        //  setState(() {});
  
          if(!snapshot.hasData){
            print("no objets");
            return CircularProgressIndicator();
          } 

          List<double> data = snapshot.data!;
          
          final userAccelerometer = data.map((double v) => v.toStringAsFixed(1)).toList();
          
          print("estoy fuera");

          return Text("Data accelerometer ${userAccelerometer}");
        },
      ),

    );
  }
}