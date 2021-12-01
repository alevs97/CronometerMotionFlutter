import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class WriteFileCache{

  /// Get the path in the cache in IOS and Android Device
  Future<String> get _cacheDirectory async{
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  /// Create the reference to file
  Future<File> get _cacheFile async{
    final cachePath = await _cacheDirectory;
    print('cache path : $cachePath');
    return File('$cachePath/accelerometer_data.txt');
  }

  Future<void> deleteFileCache() async{
    final file =await _cacheFile;
    await file.delete();
  }

  /// Write in the archieve
  Future<File?> writeProgressCache(String progress) async{
    final file = await _cacheFile;
    final dataNow = _getCurrentlyDate();

    print('progre -- File ${file.path}');
    print('progre -- progreso a guardar -> $progress');
    if(progress != Null){

      String record = dataNow + " - " + progress;
      return file.writeAsString(record, mode: FileMode.writeOnlyAppend);
    }
  }

  /// Read file
  Future<List<String>> readCacheFile() async {
    try{
      final file = await _cacheFile;
      List<String> progressInfo = await file.readAsLines();
      return progressInfo;
    }catch(e){
      return [];
    }
  } 

  String _getCurrentlyDate(){
    final currentlyDate = DateFormat("yyyy/MMM/d hh:mm").format(DateTime.now());
    return currentlyDate;
  }

}