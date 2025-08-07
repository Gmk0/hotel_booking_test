import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking/core/utils/constants/api_constants.dart';



class HiveService
{
  final Box _box =
      Hive.box('app_storage'); // Utilisation de la boîte "app_storage"

  Future<void> setString(String key, String value) async {
    await _box.put(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _box.put(key, value);
  }

  Future<void> setList(String key, List<String> value) async {
    await _box.put(key, value);
  }

  String getString(String key) {
    return _box.get(key, defaultValue: '');
  }

  bool getBool(String key) {
    return _box.get(key, defaultValue: false);
  }

  List<String> getList(String key) {
    return _box.get(key, defaultValue: <String>[]);
  }

  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  // Récupérer le token utilisateur
  String getUserToken() {
    return _box.get(STORAGE_USER_TOKEN_KEY, defaultValue: '');
  }

  // ✅ Sauvegarder si l'utilisateur a terminé l'onboarding
  Future<void> setDeviceFirstOpen(bool value) async {
    await _box.put(STORAGE_DEVICE_FIRST_OPEN_KEY, value);
  }

  // Vérifier si c'est la première ouverture de l'application
  bool getDeviceFirstOpen() {
    return _box.get(STORAGE_DEVICE_FIRST_OPEN_KEY, defaultValue: false);
  }

  // Vérifier si l'utilisateur est connecté
  bool getIsLogin() {
    return getUserToken().isNotEmpty;
  }

  /// 📌 **Sauvegarde et récupération du profil utilisateur**
  // void saveUserProfile(UserModel user) {
  //   _box.put(STORAGE_USER_PROFILE_KEY,
  //       jsonEncode(user.toJson())); // Stockage en JSON
  // }

  // UserModel getUserProfile() {
  //   final profileData = _box.get(STORAGE_USER_PROFILE_KEY, defaultValue: "");
  //   if (profileData.isNotEmpty) {
  //     return UserModel.fromJson(jsonDecode(profileData));
  //   }
  //   return UserModel.empty();
  // }
}
