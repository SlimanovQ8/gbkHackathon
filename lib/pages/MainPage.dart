import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

Future<String> getPoliceName() async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  print("ID =" + uid);

  final result =
  await FirebaseFirestore.instance.collection('Users').doc(uid).get();
  // final fbm = FirebaseMessaging();
  // String getToken = "";
  // fbm.getToken().then((value) =>
  // {
  //   FirebaseFirestore.instance
  //       .collection('MOI').doc(FirebaseAuth.instance.currentUser.uid).update({
  //
  //     'deviceID': value,
  //   })
  // });
  return result.get('Name');

}

class _MainPageState extends State<MainPage> {
  String userEmail = FirebaseAuth.instance.currentUser!.email!;
  String use = FirebaseAuth.instance.currentUser!.uid;
  var userName = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .id;
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  FutureBuilder(
          future: getPoliceName(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return Text(snapshot.data);
          },

        ),
      ),
      drawer: Drawer(

        child: Container(
          color: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,

              children: <Widget>[
                UserAccountsDrawerHeader(
                  arrowColor: Colors.orange,
                  accountName: FutureBuilder(
                    future: getPoliceName(),
                    builder: (_, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return Text(snapshot.data);
                    },

                  ),
                  accountEmail: Text(userEmail.substring(userEmail.indexOf('m') + 1, userEmail.indexOf("@"))),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      (userEmail.substring(0, 2)),
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),


                //_DisabilityCode(),




                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign out'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => LoginPage()),
                    );
                  },
                )
              ]),),),
    );
  }
}
