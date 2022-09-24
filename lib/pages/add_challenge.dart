import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class AddChallenge extends StatefulWidget {
  const AddChallenge({Key? key}) : super(key: key);

  @override
  State<AddChallenge> createState() => _AddChallengeState();
}

class _AddChallengeState extends State<AddChallenge> {
  var title = TextEditingController();
  var description = TextEditingController();
  var amount = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Challenge"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTV0eT6LjqPl8_7FNGorWnayM2dYQENPgxrNsAad3TWR_G_mICAc0pE0TgHlODbHwFbdQ&usqp=CAU"),
                TextField(
                  controller: title,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: description,
                  decoration: InputDecoration(hintText: "Description"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: amount,
                  decoration: InputDecoration(hintText: "Amount"),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AddExpense();
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            content: Text('Challenge Added'),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: new Text('Done'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  void AddExpense() async
  {
    setState(() {
      FirebaseFirestore.instance.collection("Challenges").add({
        "title": title.text,
        "description": description.text,
        "amount": amount.text,
        "parentID": FirebaseAuth.instance.currentUser!.uid,

      });
    });
  }
}

