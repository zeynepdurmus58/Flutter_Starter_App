// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class Message {
  late final String text;
  late final DateTime date;
  late final bool isSentByMe;

  Message (
    {
      required this.text,
      required this.date,
      required this.isSentByMe,
    }
  );
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  List<Message> messages = [
    Message(
      text: "Yes sure!",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "Yes",
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 3),
      ),
      isSentByMe: true,
    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: GroupedListView<Message, DateTime>(
            padding: const EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(padding: EdgeInsets.all(8),
                  child: Text(
                    DateFormat.yMMMd().format(message.date),
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(message.text),
                ),
              ),
            ),
          ),
          ),
          NewMessageWidget(
            onSubmitted: (text) {
              final message = Message(
                text: text,
                date: DateTime.now(),
                isSentByMe: true,
              );
              setState(() {});
            }
          ),
           /* Container(
            color: Colors.grey.shade200,
            child: TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: "Type your message here...",
              ),
              onSubmitted: (text) {
              final message = Message(
                text: text,
                date: DateTime.now(),
                isSentByMe: true,
              );
              setState(() {});
            },
            ),
          ), */
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
              ),
              Column(
                children: [
                  Container(
                    child: const Text("Başlık"),
                  ),
                  Container(
                    child: const Text("durum"),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Text("Kullanıcı Sorusu"),
          ),
          Container(
            child: const Text("Desteğin Cevabı"),
          ),
          Container(
            child: const Text("Problemim çözüldü"),
          ),
          
        ],
      ),
    );
  }

}

NewMessageWidget({required Null Function(dynamic text) onSubmitted}) {
}