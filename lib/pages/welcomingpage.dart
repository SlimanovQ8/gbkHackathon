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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "To Yahaloo",
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
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Family Name',
                prefixIcon: Icon(Icons.family_restroom),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.5),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.5),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 6, 25, 15),
            child: TextField(
              controller: income,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Family Income',
                  prefixIcon: Icon(Icons.money),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.5),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.5),
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(236, 229, 199, 10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 25),
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
                      primary: Color.fromARGB(246, 9, 111, 237))),
            ),
          ),
          // Text("Forget Password"),
        ]),
      ),
    );
  }
}
