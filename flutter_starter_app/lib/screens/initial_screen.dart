// ignore_for_file: prefer_const_constructors, unused_local_variable, empty_catches, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_app/storage/storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:go_router/go_router.dart';

import '../bloc/settings/settings_cubit.dart';
import '../localizations/app_localizations.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool loading = true;
  late SettingsCubit settings;

  loadApp() async {
    try {
      // durumu oku
      // ayarları oku
      final storage = AppStorage();
      var data = await storage.readAll();

      // dil
      if (data["language"] == null) {
        // bir seçim yap
        if (kIsWeb) {
          data["language"] = "tr";
          await storage.writeAppSettings(
              language: data["language"], darkMode: data["darkMode"]);
        } else {
          final String defaultLocale = Platform.localeName;
          // en_US
          // tr_TR
          var liste = defaultLocale.split('_');
          // ["en","US"]
          // ["tr", "TR"]
          var isSupported =
              AppLocalizations.delegate.isSupported(Locale(liste[0], ""));
          if (isSupported) {
            data["language"] = liste[0];
            await storage.writeAppSettings(
                language: data["language"], darkMode: data["darkMode"]);
          } else {
            data["language"] = "en";
            await storage.writeAppSettings(
                language: data["language"], darkMode: data["darkMode"]);
          }
        }
      }

      // tema
      if (data["darkMode"] == null) {
        // sisteminkini oku
        if (ThemeMode.system == ThemeMode.dark) {
          // gece modunda
          data["darkMode"] == true;
        } else {
          // gündüz modunda
          data["darkMode"] == false;
        }
      }

      //giriş yaptıysa
      if (data["loggedIn"] == null) {
        data["loggedIn"] = false;
        data["userInfo"] = [];
        storage.writeUserData(isLoggedIn: false, userInfo: []);
      }

      settings.changeDarkMode(data["darkMode"]);
      settings.changeLanguage(data["language"]);
      if (data["loggedIn"]) {
        settings.userLogin(data["userInfo"]);
      } else {
        settings.userLogout();
      }
      setState(() {
        loading = false;
      });

      if (data["loggedIn"]) {
        GoRouter.of(context).replace('/home');
      } else {
        GoRouter.of(context).replace('/welcome');
      }
    } catch (e) {}
  }

  @override
  void initState() {
    settings = context.read<SettingsCubit>();
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: loading
                ? Center(child: const CircularProgressIndicator())
                : const Text("Loaded")));
  }
}
