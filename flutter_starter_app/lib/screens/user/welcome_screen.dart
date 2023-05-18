// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_starter_app/localizations/app_localizations.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Column(
        children: [
          const Text("Ya giriş yapın ya da kayıt olun"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/login');
                  },
                  child: Text(AppLocalizations.of(context).getTranslate('login')),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/register');
                  },
                  child: Text(AppLocalizations.of(context).getTranslate('register')),
                ),
              ],
            ),
          ),
         /*  ElevatedButton(onPressed: () {
            GoRouter.of(context).replace('/home');
          }, child: Text(AppLocalizations.of(context).getTranslate("continue_no_user"))) */
        ],
      ),
    );
  }
}
