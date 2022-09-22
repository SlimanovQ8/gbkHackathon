import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbk_hackathon/Widget/bezierContainer.dart';
import 'package:gbk_hackathon/pages/MainPage.dart';
import 'package:gbk_hackathon/pages/loginPage.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKeyEmail = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formKePy = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formPasswordConfirmation =
  new GlobalKey<FormState>();
  bool isValidCivilID = false;
  final GlobalKey<FormState> _formCivilID = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyName = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUN = new GlobalKey<FormState>();

  bool ValidEmail = false;
  bool PassNotEqualPass = false;
  bool ExistEmail = false;
  bool PassLessthan7 = false;
  bool ExistCivilID = false;
  bool ExistUserName = false;
  bool isLoading = false;
  String UserEmail = '';
  String UserPass = '';
  String UserPassConfirmation = '';
  String UserCivilID = '';
  String UserName = '';
  String errorf = '';
  String UN = '';
  bool isNameEmpty = false;
  bool isUserNameEmpty = false;
  bool baw = false;
  bool isCivilIDEmpty = false;
  String errorMessage = '';
  final _auth = FirebaseAuth.instance;

  void SignUp(String Name, String Usnm, String email,
      String password, String passwordConfirmation, BuildContext ctx) async {
    UserCredential authResult;
    try {
      setState(() {
        isLoading = true;
        ValidEmail = false;
        PassNotEqualPass = false;
        ExistEmail = false;
        PassLessthan7 = false;
        ExistCivilID = false;
        isNameEmpty = false;
        isUserNameEmpty = false;
        isCivilIDEmpty = false;
        isValidCivilID = false;
      });


      if (!email.contains("@") || !email.contains("."))
        setState(() {
          ValidEmail = true;
        });


      if (password.length < 7) {
        setState(() {
          PassLessthan7 = true;
        });
      }
      if (Name.length < 1) {
        setState(() {
          isNameEmpty = true;
        });
      }

      if (UN.length < 1) {
        setState(() {
          isUserNameEmpty = true;
        });
      }


      if (password.compareTo(passwordConfirmation) != 0) {
        setState(() {
          PassNotEqualPass = true;
        });
      }



      final UserN = await FirebaseFirestore.instance
          .collection('UserNames')
          .doc(UN)
          .get();
      if(UserN.exists)
      {
        setState(() {
          ExistUserName = true;
        });
      }

      if (!ValidEmail &&
          !PassNotEqualPass &&
          !ExistEmail &&
          !PassLessthan7 &&
          !ExistCivilID &&
          !isNameEmpty &&
          !isUserNameEmpty &&
          !ExistUserName) {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String getToken = "";

        await FirebaseFirestore.instance
            .collection('UserNames')
            .doc(Usnm)
            .set({
          'UserName': Usnm,
          'deviceID': getToken,
          'UID': authResult.user!.uid,
        });
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(authResult.user!.uid)
            .set({
          'Name': Name,
          'email': email.toLowerCase(),
          'password': password,
          'deviceID': getToken,
          'UserName': Usnm,
          'FirstTime': "true",


        });
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => MainPage())
        );

      } else {
        var timer = Timer(
            Duration(seconds: 1),
                () => setState(() {
              isLoading = false;
            }));
      }
    } on FirebaseAuthException catch (err) {
      var message = 'An error occurred, please check your credentials!';

      if (err.message != null) {
        message = err.message!;

        switch (err.code) {
          case "invalid-email":
            setState(() {
              ValidEmail = true;
              isLoading = false;
            });
            ValidEmail= true;
            errorMessage = "Your email address appears to be malformed.";
            isLoading = false;
            break;
          case "email-already-in-use":
            setState(() {
              isLoading = false;
              ExistEmail = false;
            });
            ExistEmail = true;
            errorMessage = "email already exist.";
            isLoading = false;
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "ERROR_USER_DISABLED":
            errorMessage = "User with this email has been disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        setState(() {
          isLoading = false;

        });
      }



      setState(() {
        isLoading = false;

      });
    } catch (err) {
      print(err);

      setState(() {
        errorf = err.toString();
        isLoading = false;

      });
    }

  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }


  Widget _submitButton() {
    return Container(
      width:  MediaQuery.of(context).size.width * 1,
      height: 45,
      margin: EdgeInsets.all( 30),
      child: isLoading ? Center(
        child: CircularProgressIndicator(
          color:  Color(0xfff7892b),
        ),
      ): ElevatedButton(
        child: Text("Register",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),

        ),
        style: ElevatedButton.styleFrom(
          primary:  Color(0xfff7892b),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),

        onPressed: () {
          SignUp(UserName, UN, UserEmail, UserPass, UserPassConfirmation, context);

        },
      ),
    );

    }


  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign in',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Q8',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
         ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            key: _formKeyName,
            autovalidateMode: AutovalidateMode.always,
            validator: (b) {
              if (isNameEmpty) return "Name cannot be empty";
              return null;
            },
            onChanged: (String s) {
              setState(() {
                UserName = s;
              });
            },
            obscureText: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
        Text(
          'User Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            key: _formKeyUN,
            autovalidateMode: AutovalidateMode.always,
            validator: (b) {
              if (isNameEmpty) return "User Name cannot be empty";
              return null;
            },
            onChanged: (String s) {
              setState(() {
                UN = s;
              });
            },
            obscureText: false,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
          Text(
          'Email',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(

            key: _formKeyEmail,
            autovalidateMode: AutovalidateMode.always,
            validator: (f) {
              if (ExistEmail) return "Email address already exist";
              if (ValidEmail) return "Email address not valid";
              return null;
            },
            onChanged: (String s) {
              setState(() {
                UserEmail = s;
              });
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
        Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            key: _formKePy,
            autovalidateMode: AutovalidateMode.always,
            validator: (f) {
              if (PassLessthan7)
                return 'Password should be at least 7 Characters';
              return null;
            },
            onChanged: (String s) {
              setState(() {
                UserPass = s;
              });
            },
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true)),
        Text(
          'Password Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            key: _formPasswordConfirmation,
            autovalidateMode: AutovalidateMode.always,
            validator: (f) {
              if (PassNotEqualPass)
                return 'Password Confirmation does not matches password';
              return null;
            },
            onChanged: (String s) {
              setState(() {
                UserPassConfirmation = s;
              });
            },
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: height,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(
                        height: 50,
                      ),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton(),
                      SizedBox(height: 14),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
          ),
        ));
  }
}
