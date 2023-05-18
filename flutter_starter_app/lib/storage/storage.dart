// ignore_for_file: unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

class AppStorage{

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
    bool isLoggedIn,
    List<String> userInfo,
  ) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool("isLoggedIn", isLoggedIn);
    storage.setStringList("userInfo", userInfo);
  }

  //uygulama ayarlarını yaz
  writeAppSettings(
    String language,
    bool darkMode,
  ) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString("language", language);
    storage.setBool("darkMode", darkMode);
  }
}