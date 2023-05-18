// ignore_for_file: unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

class AppStorage{
  //hepsini oku
  Future<Map<String, dynamic>> readAll() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    var loggedIn = storage.getBool("isLoggedIn");
    var userInfo = storage.getStringList("userInfo");
    var language = storage.getString("language");
    var darkMode = storage.getBool("darkMode");

    return {
      "loggedIn": loggedIn,
      "userInfo": userInfo,
      "language": language,
      "darkMode": darkMode,
    };
  }

  //kullanıcı verilerini oku
  readUserData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    //kullanıcı giriş yaptı mı yapmadı mı
    var loggedIn = storage.getBool("isLoggedIn");

    //eğer kullanıcı giriş yaptıysa bilgilerini liste olarak kaydet
    var userInfo = storage.getStringList("userInfo");

    return {
      "loggedIn": loggedIn,
      "userInfo": userInfo,
    };
  }

  //uygulama ayarlarını oku
  readAppSettings() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    //dil seçti mi seçmedi mi
    var language = storage.getString("language");

    //gece moduna girdi mi girmedi mi
    var darkMode = storage.getBool("darkMode");

    return {
      "language": language,
      "darkMode": darkMode,
    };
  }
 
  //kullanıcı verilerini yaz
  writeUserData(
    {required bool isLoggedIn,
    required List<String> userInfo,}
  ) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool("isLoggedIn", isLoggedIn);
    storage.setStringList("userInfo", userInfo);
  }

  //uygulama ayarlarını yaz
  writeAppSettings(
    {required String language,
    required bool darkMode,}
  ) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString("language", language);
    storage.setBool("darkMode", darkMode);
  }
}