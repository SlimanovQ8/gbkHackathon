import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('Expense')
            .where('parentID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder:
            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if (snapshot.data!.docs.length == 0){


            return new SingleChildScrollView(
              child: Center(

              ),

            );
          }
          else
          {
            return ListView(
              children: List.generate(snapshot.data!.docs.length, (index) =>
                  Card(
                    color: Colors.grey[200],
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                        snapshot.data!.docs[index].get("title"),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data!.docs[index].get("amount"),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              snapshot.data!.docs[index].get("amountdate"),
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),)


            );


          }
        });
  }
}
