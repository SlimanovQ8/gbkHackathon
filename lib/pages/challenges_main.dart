import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gbk_hackathon/Widget/challenge_card.dart';
import 'package:go_router/go_router.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/addchallenge");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("All Challenges"),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/Puzzle.png"),
          SizedBox(
            height: 25,
          ),
          Text("All Challenges"),
          // SizedBox(
          //   height: 15,
          // ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: [
              InkWell(
                onTap: () {
                  // context.push("");
                },
                child: ChallengesCard(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
