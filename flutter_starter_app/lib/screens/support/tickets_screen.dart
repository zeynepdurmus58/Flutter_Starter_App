import 'package:flutter/material.dart';
import 'package:flutter_starter_app/localizations/app_localizations.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(AppLocalizations.of(context).getTranslate("tickets")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.amber,
                  height: 60,
                  width: 60,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        color:Colors.blue.shade800,
                        child: const Text("Başlık"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blueGrey,
                        alignment: Alignment.bottomRight,
                        child: const Text("durum"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}