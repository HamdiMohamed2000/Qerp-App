abstract class Storage {
  Future<void> storeLang({required String langCode});
  String getLang();
  Future<void> deleteLang();
}