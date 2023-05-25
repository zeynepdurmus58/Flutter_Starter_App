// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

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
    return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                style: TextStyle(
                  fontSize: 47,
                  fontStyle: FontStyle.italic,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
                AppLocalizations.
                of(context).getTranslate("welcome_to_my_app"),
              ),
            ),
            //const Text("Ya giriş yapın ya da kayıt olun"),
            /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/login');
                    },
                    child:
                        Text(AppLocalizations.of(context).getTranslate('login')),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/register');
                    },
                    child: Text(
                        AppLocalizations.of(context).getTranslate('register')),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).replace('/home');
                },
                child: Text(AppLocalizations.of(context)
                    .getTranslate("continue_no_user"))),
            SizedBox(
              width: 5,
            ), */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    GoRouter.of(context).push('/register');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    child: Text(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        AppLocalizations.of(context).getTranslate("get_started")),
                  )),
            ),
    
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 22, 128, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                onPressed: () {
                  GoRouter.of(context).push('/login');
                },
                child: Container(
                  child: Text(AppLocalizations.of(context)
                      .getTranslate("i_already_have_an_account")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 22, 128, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                onPressed: () {
                  GoRouter.of(context).push('/home');
                },
                child: Container(
                  child: Text(AppLocalizations.of(context)
                      .getTranslate("continue_no_user")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
