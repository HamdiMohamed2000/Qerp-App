import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:qerp_app/core/storage/storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qerp_app/core/storage/storage_impl.dart';

Future<void> initStorageInjection(GetIt sl)async{

// Get App Directory And Init Hive
final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
await Hive.initFlutter(appDocumentDir.path);

//Open Box
Box<String> stringBox = await Hive.openBox<String>('stringBox');


//injection
sl.registerLazySingleton<Box<String>>(() => stringBox);

//Register Storage
sl.registerFactory<Storage>(() => StorageImpl(stringBox: stringBox));
}