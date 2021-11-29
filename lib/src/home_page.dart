import 'dart:async';

import 'package:acelerometer/functions/accelerometer_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  late AccelerometerFunction _accelerometerFunction;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _accelerometerFunction = Provider.of<AccelerometerFunction>(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acelerometer Data"),
      ),
      body: 
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('UserAccelerometer: ${_accelerometerFunction.accelerometer} '),
                  ],
                ),
              ),
            ],
          
      ),
    );
  }
}