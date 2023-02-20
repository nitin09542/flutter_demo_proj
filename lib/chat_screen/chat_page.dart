import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../themes/theme.dart';

class ChatScreen extends StatefulWidget {
  final String id;

  ChatScreen({required this.id});

  @override
  _ChatScreenState createState() => _ChatScreenState(id: id);
}

class _ChatScreenState extends State<ChatScreen> {
  final String id;
  List<dynamic> mychatList = <dynamic>[];
  List<dynamic> mychatList_1 = <dynamic>[];

  _ChatScreenState({required this.id});

  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final databaseReference =
        FirebaseDatabase.instance.reference().child('message').child('user_');
    //get firebase messages
    databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic>? mapdata = event.snapshot.value as Map?;
        mychatList.clear();

        mapdata!.forEach((key, value) {
          setState(() {
            mychatList.add(value);
          });
        });
        mychatList.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));
        mychatList_1=mychatList.reversed.toList();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
              child: mychatList_1.length == 0
                  ? Center(child: Text("Chat is empty"))
                  : ListView.builder(
                   reverse: true,
                      itemCount: mychatList_1.length,
                      itemBuilder: (context, index) {
                        return mychatList_1[index]['sender'] == id
                            ?
                        Container(
                                  margin: EdgeInsets.all(10.0),

                                  child: Wrap(
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    alignment: WrapAlignment.end,
                                    children: [
                                      Text(mychatList_1[index]['text'] +
                                          "---" +
                                          mychatList_1[index]['sender']),
                                    ],
                                  ))

                            :
                        Container(

                                      margin: EdgeInsets.all(10.0),
                                      child: Wrap(
                                        spacing: 5.0,
                                        runSpacing: 5.0,
                                        alignment: WrapAlignment.start,
                                        children: [
                                          Text(
                                            mychatList_1[index]['text'] +
                                                "---" +
                                                mychatList_1[index]['sender'],
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ));



                      },
                    )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = _textController.text;
                    final sender =
                        '$id'; // or get the sender name from user auth
                    final timestamp = DateTime.now().toString();
                    databaseReference.push().set({
                      'text': text,
                      'sender': sender,
                      'timestamp': timestamp,
                    });
                    _textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
