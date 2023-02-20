import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfilePage();
}

class _ProfilePage extends State<Profile> {
  var myList = <dynamic>[];

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: myList.length==0?Center(child: CircularProgressIndicator()):
        ListView.builder(
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.list),
                  trailing:  Text(
                    myList[index]['email'],
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text(myList[index]['name']));
            }));
  }

  Future<dynamic> getData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('users');
    await _collectionRef.doc('user_one').set({
      'name': 'John Doe',
      'id': 101,
      'email': 'johndoe@example.com',
    });
    await _collectionRef.doc('user_two').set({
      'name': 'Joh Doe',
      'id': 102,
      'email': 'johdoe@example.com',
    });
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    setState(() {
      myList = querySnapshot.docs.map((doc) => doc.data()).toList();
    });

    print("djdf $myList");
  }
}
