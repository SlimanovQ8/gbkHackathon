import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Title",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "234KD",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "12/2/2022",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
