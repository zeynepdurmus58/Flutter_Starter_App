// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/settings/setting_cubit.dart';
import 'bloc/settings/settings_state.dart';
import 'localizations/app_localizations.dart';
import 'routes/routes.dart';
import 'themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(SettingsState()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Starter',
            debugShowCheckedModeBanner: false,

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            // desteklenen diller
            supportedLocales: AppLocalizations.supportedLanguages
                .map((e) => Locale(e, ""))
                .toList(),
            /* const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
            Locale('fr', 'FR'),
            Locale('ar', 'AR'),
            Locale('fa', 'FA'),
            Locale('es', 'ES'),
          ], */

            // şu an hangi dil
            locale: Locale(state.language, ""),
            themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            /* ThemeData(
              brightness: state.darkMode ? Brightness.dark : Brightness.light,
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              //useMaterial3: true,
            ), */
            routerConfig: routes,
          );
        },
      ),
    );
  }
}
