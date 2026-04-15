import 'package:hive/hive.dart';
import 'package:qerp_app/core/config/env_keys.dart';
import 'package:qerp_app/core/extentions/env.dart';
import 'package:qerp_app/core/storage/storage.dart';

class StorageImpl extends Storage{

  final Box<String> stringBox;

  StorageImpl({required this.stringBox});

  static final String _language = EnvKeys.language.env;

  @override
  Future<void> deleteLang() async{
    await stringBox.delete(_language);
  }

  @override
  String getLang() {
    return stringBox.get(_language) ?? "ar";
  }

  @override
  Future<void> storeLang({required String langCode})async {
    await stringBox.put(_language, langCode);
  }
  

}