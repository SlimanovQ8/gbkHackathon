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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    backgroundColor: Colors.grey[200],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name:",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "Kid Name",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date of Birth:",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "20/12/2020",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Expenses:",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                child: ListView(children: [
                  ExpensesCard(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
