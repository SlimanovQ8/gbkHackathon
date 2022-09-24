import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../Widget/expenses_card.dart';

class KidDetail extends StatefulWidget {
  const KidDetail({Key? key}) : super(key: key);

  @override
  State<KidDetail> createState() => _KidDetailState();
}

class _KidDetailState extends State<KidDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kid Details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/addexpense");
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    Text("Name"),
                    Text("Kid Name"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text("Expenses:"),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(children: [
                ExpensesCard(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
