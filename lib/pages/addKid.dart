import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddKid extends StatefulWidget {
  AddKid({Key? key}) : super(key: key);

  @override
  State<AddKid> createState() => _AddKidState();
}
String _selectedDate = 'Tap to select date';

class _AddKidState extends State<AddKid> {

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = d.year.toString() + '-' + d.month.toString() + '-' + d.day.toString();
      });
  }
  var kidName = TextEditingController();

  var dateOfBirth = TextEditingController();
  final _picker = ImagePicker();
  XFile? _image;
  bool is0bscurePassword = true;

  bool chk = false;
  @override

  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        body: Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
                onTap: () {

                },
                child: ListView(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Add Your Lovely Kid",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: Container(
                        height: height / 4,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 194, 194, 194)),
                        child: chk == false
                            ? SizedBox.fromSize(
                          child: Material(
                            color: Color.fromARGB(255, 194, 194, 194),
                            child: InkWell(
                              splashColor: Colors.black87,
                              onTap: () async {
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  _image = XFile(image!.path) ;
                                  print(_image);
                                  chk = true;

                                });

                              },

                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.image,
                                    size: (height + width) / 7.5,
                                    color: Colors.white70,
                                  ), // <-- Icon
                                  Text(
                                    "Pick Image from Gallery",
                                    style: TextStyle(
                                      fontSize: (height + width) / 90,
                                    ),
                                  ), // <-- Text
                                ],
                              ),
                            ),
                          ),
                        )


                            : Image.file(
                            File(_image!.path),
                            fit: BoxFit.fitWidth)
                    ) ,
                  ),

                  SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  TextField(
                    controller: kidName,
                    decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.child_care),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(

                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(

                          decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 1.0, color: Colors.black),
                                left: BorderSide(width: 1.0, color: Colors.black),
                                right: BorderSide(width: 1.0, color: Colors.black),
                                bottom: BorderSide(width: 1.0, color: Colors.black),
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
                                  onTap: (){
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 25),
                        child: SizedBox(
                          width: 340,
                          height: 49,
                          child: ElevatedButton(
                            onPressed: () async {
                              AddKid();
                            },
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 15,
                                  // letterSpacing: 2,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                                primary: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                        child: SizedBox(
                          width: 340,
                          height: 49,
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 15,
                                    // letterSpacing: 2,
                                    color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                                primary: Theme.of(context).dividerColor,
                              )),
                        ),
                      ),
                    ],
                  )
                ]))));
  }
  String name = "";
void AddKid() async
{
  setState(() {
   FirebaseFirestore.instance.collection("Kids").add({
      "name": kidName.text,
      "dob": _selectedDate,
     "parentID": FirebaseAuth.instance.currentUser!.uid,
      "image": _image!.path,

    });
  });
}
}
