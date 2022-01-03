import 'dart:async';

class Chronometer{

  late DateTime _startDateTime;
  final _mainStreamController =  StreamController<String>();
  final _stateStreamController = StreamController<bool>();
  bool _isRunning = false;
  late String _inactiveTime;

  Stream<String> get chronometerStream{
    return _mainStreamController.stream;
  }

  Stream<bool> get stateStream{
    return _stateStreamController.stream;
  }

  bool get isRunning{
    return _isRunning;
  }

  String get getInactiveTime{
    return _inactiveTime;
  }

  void start(){
    _isRunning =true;
    
    Timer(Duration(seconds: 20),(){
    _startDateTime = DateTime.now();
    _stateStreamController.sink.add(true);
      
      Timer.periodic(Duration(milliseconds: 1), (timer) {
        if(!_isRunning){
          timer.cancel();
          return;
        }

        final difference = DateTime.now().difference(_startDateTime);
        final formated = difference.toString();
        _inactiveTime = formated + "\n"; 
        _mainStreamController.sink.add(formated); // return Duration 
      
      });
    });
  }

  void stop(){
    _isRunning = false;
    _stateStreamController.sink.add(false);
  }
}