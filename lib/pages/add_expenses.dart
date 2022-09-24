import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class AddExpenses extends StatefulWidget {
  AddExpenses({Key? key}) : super(key: key);

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  String _selectedDate = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = d.year.toString() + '-' + d.month.toString() + '-' +
            d.day.toString();
      });
  }

  var title = TextEditingController();

  var amount = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Expenses"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTV0eT6LjqPl8_7FNGorWnayM2dYQENPgxrNsAad3TWR_G_mICAc0pE0TgHlODbHwFbdQ&usqp=CAU"),
                TextField(
                  controller: title,
                  decoration: InputDecoration(hintText: "Title"),
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
                Padding(

                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(

                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.black),
                              left: BorderSide(width: 1.0, color: Colors.black),
                              right: BorderSide(width: 1.0,
                                  color: Colors.black),
                              bottom: BorderSide(width: 1.0,
                                  color: Colors.black),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                    _selectedDate,
                                    textAlign: TextAlign.center,

                                    style: TextStyle(color: Color(0xFF000000),
                                        fontSize: 24)
                                ),
                                onTap: () {
                                  _selectDate(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                tooltip: 'Tap to open date picker',
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          builder: (context) =>
                          new AlertDialog(
                            content: Text('Expense Added'),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  AddExpense();
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

  void AddExpense() async
  {
    setState(() {
      FirebaseFirestore.instance.collection("Expense").add({
        "title": title.text,
        "amount": amount.text,
            "amountdate": _selectedDate,
        "parentID": FirebaseAuth.instance.currentUser!.uid,

      });
    });
  }
}