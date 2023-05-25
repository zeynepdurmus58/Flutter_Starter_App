// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../api/system_api.dart';
import '../../bloc/settings/settings_cubit.dart';
import '../../localizations/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SettingsCubit settings;
  String mail = "";
  String passwd = "";
  List<String> warnings = [];
  bool loading = false;

  showWarnings() {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(AppLocalizations.of(context).getTranslate('warning')),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text(AppLocalizations.of(context).getTranslate('close')),
                ),
              ],
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: warnings
                      .map((e) => Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            AppLocalizations.of(context).getTranslate(e),
                            textAlign: TextAlign.start,
                          )))
                      .toList()),
            ));
  }

  login() async {
    setState(() {
      loading = true;
    });

    List<String> msgs = [];
    if (mail.trim().isEmpty) {
      msgs.add("mail_required");
    }
    if (passwd.trim().length < 6) {
      msgs.add("passwd_length");
    }

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mail);

    if (!emailValid) {
      msgs.add("email_format");
    }

    if (msgs.isEmpty) {
      // everything is ok
      // i can login
      final api = SystemApi();
      final result = await api.login(email: mail, password: passwd);
      if (result == null) {
        warnings = [
          AppLocalizations.of(context).getTranslate('invalid_credentials')
        ];
        setState(() {});
        showWarnings();
      } else {
        print("After login : $result");
        // login successfull
        List<String> data = [
          result["name"],
          result["email"],
          result["phone"] ?? "",
          result["token"],
        ];
        settings.userLogin(data);
        GoRouter.of(context).replace('/home');
      }
    } else {
      showWarnings();
    }

    setState(() {
      warnings = msgs;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    settings = context.read<SettingsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // e-mail
          Text(
            textAlign: TextAlign.right,
            AppLocalizations.of(context).getTranslate('mail'),
            style: TextStyle(fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).getTranslate('mail'),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 245, 78),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ),
          // şifre
          Text(
            AppLocalizations.of(context).getTranslate('passwd'),
            style: TextStyle(fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).getTranslate('passwd'),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 245, 78),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ),
          // buton
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => login(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                //height: 35,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).getTranslate('login'),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /*  Padding(
        padding: const EdgeInsets.all(8.0),
        child: loading ? const Center(child: CircularProgressIndicator()) : Column(
          children:[
            Text(AppLocalizations.of(context).getTranslate('mail')),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) => setState(() {
                mail = value;
              }),
            ),
            const SizedBox(height: 8),
            Text(AppLocalizations.of(context).getTranslate('passwd')),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              onChanged: (value) => setState(() {
                passwd = value;
              }),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () => login(),
              child: Text(AppLocalizations.of(context).getTranslate('login')),
            ),
          ]
        ),
      ), */
        ],
      ),
    );
  }
}
