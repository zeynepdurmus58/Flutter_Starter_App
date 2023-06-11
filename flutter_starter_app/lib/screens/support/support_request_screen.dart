// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SupportRequestScreen extends StatefulWidget {
  const SupportRequestScreen({super.key});

  @override
  State<SupportRequestScreen> createState() => _SupportRequestScreenState();
}

class _SupportRequestScreenState extends State<SupportRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Support Request"),
          Row(children: [
            Container(
              color: Colors.amber,
              child: Text(""" Konu - 
                Muhasebe - Öğrenci İşleri - Rektör"""),
            ),
          ]),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [Container(
                  color: Colors.blue,
                  child: Text("Konu Başlığı"))]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [Container(
                  color:Colors.amberAccent,
                  child: Text("Destek Mesajı"))]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [Container(
                  color: Colors.blue,
                  child: Text("GÖNDER BUTONU"))]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
