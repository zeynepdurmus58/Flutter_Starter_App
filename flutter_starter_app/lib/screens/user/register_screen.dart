// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../api/system_api.dart';
import '../../bloc/settings/settings_cubit.dart';
import '../../localizations/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late SettingsCubit settings;
  String name = "";
  String phone = "";
  String mail = "";
  String passwd = "";
  List<String> warnings = [];
  bool loading = false;

  showWarnings() {
    showDialog(context: context, builder:(context) => CupertinoAlertDialog(
      title: Text(AppLocalizations.of(context).getTranslate('warning')),
      actions: [
        CupertinoDialogAction(
          onPressed: ()=>Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).getTranslate('close')),
        ),
      ],
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: warnings.map((e) => Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  AppLocalizations.of(context).getTranslate(e),
                  textAlign: TextAlign.start,
                ))).toList()
            ),
    ));
  }
  register() async {

    setState(() {
      loading = true;
    });

    List<String> msgs =[];
    if(mail.trim().isEmpty) {
      msgs.add("mail_required");
    }
    if(passwd.trim().length < 6) {
      msgs.add("passwd_length");
    }

    final bool emailValid = 
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(mail);

    if(!emailValid) {
      msgs.add("email_format"); 
    }

    if(name.trim().isEmpty){
      msgs.add("name_required"); 
    }

    if(phone.trim().isEmpty){
      msgs.add("phone_required"); 
    }

    if(msgs.isEmpty) {
      // everything is ok
      // i can login
      final api = SystemApi();
      final result = await api.register(
        email: mail.trim(),
        name: name.trim(),
        password: passwd.trim(),
        phone: phone.trim(),
      );
      if(result == null) {
        setState(() {
          warnings = [AppLocalizations.of(context).getTranslate('register_failed')];  
        });
        showWarnings();
      }
      else {
        // register successfull
        List<String> data = [
          name.trim(), 
          mail.trim(), 
          phone.trim(), 
          result.trim(), 
        ];
        settings.userLogin(data);
        GoRouter.of(context).replace('/home');
      }
    }

    if(msgs.isNotEmpty) {
      showWarnings();
    }

    setState(() {
      warnings = msgs;
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          // isim
          Text(
            textAlign: TextAlign.right,
            AppLocalizations.of(context).getTranslate('name'),
            style: TextStyle(fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).getTranslate('name'),
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
          // telefon
          Text(
            textAlign: TextAlign.right,
            AppLocalizations.of(context).getTranslate('phone'),
            style: TextStyle(fontSize: 13),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).getTranslate('phone'),
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
              onPressed: () => register(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                //height: 35,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).getTranslate('register'),
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
  }
}