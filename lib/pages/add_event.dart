import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = TextEditingController();
    var description = TextEditingController();
    var amount = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Event"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset("assets/images/Events.png"),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: title,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: description,
                  decoration: InputDecoration(hintText: "Description"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: amount,
                  decoration: InputDecoration(hintText: "Amount"),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            content: Text('Event Added'),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: new Text('Done'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
