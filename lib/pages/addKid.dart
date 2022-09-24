import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddKid extends StatefulWidget {
  AddKid({Key? key}) : super(key: key);

  @override
  State<AddKid> createState() => _AddKidState();
}

class _AddKidState extends State<AddKid> {
  var kidName = TextEditingController();

  var dateOfBirth = TextEditingController();
  final _picker = ImagePicker();
  File? _image;
  bool is0bscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        body: Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
                onTap: () {
                  print("edit image test");
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) => Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Choose Profile Photo",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                                width: 100,
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.camera),
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    _image = File(image!.path);
                                  });
                                },
                                label: Text("From Camera  "),
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.image),
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    _image = File(image!.path);
                                  });
                                },
                                label: Text("From Gallary   "),
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                                label: Text("Remove Image"),
                              )
                            ],
                          ))));
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
                  Center(
                      child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: _image != null
                                ? NetworkImage('')
                                : NetworkImage(_image.toString()),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )))
                    ],
                  )),
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
                  Container(
                    height: 45,
                    child: ElevatedButton(
                      child: Text("Date Of Birth"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: Theme.of(context).primaryColor),
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
                              // User user = (User(
                              //     username: usernameController.text,
                              //     password: passwordController.text,
                              //     image: _image?.path));
                              // await context
                              //     .read<UserProvider>()
                              //     .editProfileProvider(user);
                              // context.push("/SecondMain");
                              // print("testing edit profile credintials");
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

  // Widget buildTextField(String labelText, String placeholder, String controller,
  //     bool isPasswordTextField, Widget prefixIcon) {
  //   return Padding(
  //       padding: EdgeInsets.fromLTRB(25, 15, 25, 6),
  //       child: TextField(
  //           obscureText: isPasswordTextField ? is0bscurePassword : false,
  //           decoration: InputDecoration(
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(12.5),
  //                 borderSide: const BorderSide(
  //                     width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
  //               ),
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(12.5),
  //                 borderSide: const BorderSide(
  //                     width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
  //               ),
  //               filled: true,
  //               fillColor: Colors.white,
  //               suffixIcon: isPasswordTextField
  //                   ? IconButton(
  //                       icon: Icon(Icons.remove_red_eye, color: Colors.grey),
  //                       onPressed: () {})
  //                   : null, // IconButton
  //               contentPadding: EdgeInsets.only(bottom: 5),
  //               labelText: labelText,
  //               floatingLabelBehavior: FloatingLabelBehavior.always,
  //               hintText: placeholder,
  //               hintStyle: TextStyle(
  //                 color: Colors.grey,
  //               ))));
  // }
}
