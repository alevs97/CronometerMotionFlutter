import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Motion extends StatefulWidget {
  Motion({Key? key}) : super(key: key);

  @override
  _MotionState createState() => _MotionState();
}

class _MotionState extends State<Motion> {

  List<double>? _userAccelerometerValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            _userAccelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
  }


  bool isWorking(){
    bool stateX = false;
    bool stateY = false;
    bool stateZ = false;

    if(_userAccelerometerValues !=null){
      if(-0.3 < _userAccelerometerValues![0] && _userAccelerometerValues![0]< 0.3 ){
        stateX = true;
      }
      if(-0.3 < _userAccelerometerValues![1] && _userAccelerometerValues![1]< 0.3 ){
        stateY = true;
      }
      if(-0.3 < _userAccelerometerValues![2] && _userAccelerometerValues![2]< 0.3 ){
        stateZ = true;
      }
      if(stateX && stateY && stateZ){
        print("true state");
        return true;
      }else{
        print("flase state");
        return false;
      }

    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Aceleromenter text'),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('UserAccelerometer: $userAccelerometer'),
                ],
              ),
            ),
          isWorking() ? Text("Not working") : Text("Working")
        ],
      ),
    );
  }
}