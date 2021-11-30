import 'dart:io';

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
    print('progre Path del cache : $cachePath');
    return File('$cachePath/ }.txt');
  }

  Future<void> _deleteFileCache() async{
    final file =await _cacheFile;
    await file.delete();
  }

  /// Write in the archieve
  Future<File?> _writeProgressCache(String progress) async{
    final file = await _cacheFile;
    print('progre -- File ${file.path}');
    print('progre -- progreso a guardar -> $progress');
    if(progress != Null){
      return file.writeAsString(progress);
    }
  }

  /// Read file
  Future<String> _readCacheFile() async {
    try{
      final file = await _cacheFile;
      String progressInfo = await file.readAsString();
      return progressInfo;
    }catch(e){
      return '0';
    }
  } 

}