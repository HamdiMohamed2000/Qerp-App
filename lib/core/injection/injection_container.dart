import 'package:get_it/get_it.dart';
import 'package:qerp_app/core/navigator/inj_navigator.dart';
import 'package:qerp_app/core/network/network_service_inj.dart';
import 'package:qerp_app/core/storage/storage_inj.dart';
import 'package:qerp_app/features/layout_screen/layout_inj.dart';

GetIt sl = GetIt.instance;

Future<void> init()async{
await initStorageInjection(sl);
initNetworkService(sl);
initNavigator(sl);
initLayoutInjection(sl);
}