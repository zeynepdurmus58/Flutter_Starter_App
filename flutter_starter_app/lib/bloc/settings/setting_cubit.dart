// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/storage.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(super.initialSatte);

  changeLanguage(String lang) async {
    // varsayılan durumu güncelle
    final newState = SettingsState(
      language: lang,
      darkMode: state.darkMode,
      userInfo: state.userInfo,
      userLoggedIn: state.userLoggedIn,
    );

    //yeni durumu hafızaya kaydet
    emit(newState);
    
    // yeni dili duruma yaz
    final storage = AppStorage();
    
    await storage.writeAppSettings(
      darkMode: state.darkMode,
      language: lang,
    );
  }

  changeDarkMode(bool darkMode) {
    final newState = SettingsState(
      language: state.language,
      darkMode: darkMode,
      userInfo: state.userInfo,
      userLoggedIn: state.userLoggedIn,
    );
    //yeni durumu kaydet
    emit(newState);

    // yeni temayı duruma yaz
    final storage = AppStorage();
    
    storage.writeAppSettings(
      darkMode: darkMode,
      language: state.language,
    );
  }

  userLogin(List<String> userInfo) async {
    final newState = SettingsState(
      language: state.language,
      darkMode: state.darkMode,
      userInfo: userInfo,
      userLoggedIn: true,
    );
    //yeni durumu kaydet
    emit(newState);

    // 
    final storage = AppStorage();
    
    await storage.writeUserData(
      isLoggedIn: true,
      userInfo: userInfo,
    );
  }

  userLogout() async {
    final newState = SettingsState(
      language: state.language,
      darkMode: state.darkMode,
      userInfo: [],
      userLoggedIn: false,
    );
    //yeni durumu kaydet
    emit(newState);

    //
    final storage = AppStorage();
    
    await storage.writeUserData(
      isLoggedIn: false,
      userInfo: [],
    );
  }

  userUpdate(List<String> userInfo) async {
    final newState = SettingsState(
      language: state.language,
      darkMode: state.darkMode,
      userInfo: userInfo,
      userLoggedIn: true,
    );
    //yeni durumu kaydet
    emit(newState);

    final storage = AppStorage();
    
    await storage.writeUserData(
      isLoggedIn: true,
      userInfo: userInfo,
    );
  }
}