import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var familyName = TextEditingController();
    var income = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 50,
          ),

          Image(
              width: 275,
              height: 300,
              image: AssetImage("assets/images/gbk-logo.png")),
          Text(
            "Welcome",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          Text(
            "To N9or",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 6),
            child: TextField(
              controller: familyName,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.family_restroom),
                  hintText: "Enter Family Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 6, 25, 15),
            child: TextField(
              controller: income,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: "Enter Family Income",
                  prefixIcon: Icon(Icons.money)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
            child: SizedBox(
              width: 340,
              height: 49,
              child: ElevatedButton(
                onPressed: () async {
                  context.push("/homepage");
                },
                child: Text("Welcome"),
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    primary: Theme.of(context).primaryColor),
              ),
            ),
          ),
          // Text("Forget Password"),
        ]),
      ),
    );
  }
}
