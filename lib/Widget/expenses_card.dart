import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Title",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Amount:",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "234KD",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date:",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "12/2/2022",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
