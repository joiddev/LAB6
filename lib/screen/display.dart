import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreen();
}

class _DisplayScreen extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("รายงานคะแนนสอบ")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Students").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(child: Text(document["score"])),
                  ),
                  title: Text(document["fname"] + document["lname"]),
                  subtitle: Text(document["email"]),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
