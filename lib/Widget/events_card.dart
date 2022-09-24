import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Title",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                "23KD",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Description",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
        ]),
      ),
    );
  }
}
