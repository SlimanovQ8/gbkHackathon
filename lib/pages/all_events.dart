import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gbk_hackathon/Widget/challenge_card.dart';
import 'package:gbk_hackathon/Widget/events_card.dart';
import 'package:go_router/go_router.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/addevent");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("All Events"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/Claps.gif"),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "All Challenges",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: [
              InkWell(
                onTap: () {
                  // context.push("");
                },
                child: EventsCard(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
