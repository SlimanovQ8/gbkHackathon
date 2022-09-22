import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gbk_hackathon/main.dart';
import 'package:gbk_hackathon/pages/MainPage.dart';
import 'package:gbk_hackathon/pages/SignUpPage.dart';

import 'package:gbk_hackathon/Widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ValidEmail = false;
  bool ValidMoiNumber = false;
  bool ValidPass = false;
  bool isLoading = false;
  bool isCivPressed = true;
  String UserEmail = '';
  String UserPass = '';
  final _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKeyPassword = new GlobalKey<FormState>();



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
        child: Text("Login",
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
          SignIn(UserEmail, UserPass, context);

        },
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }


  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
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
              color: Color(0xffe46b10)
          ),
          children: [

          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[

        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String s) {
                    setState(() {
                      UserEmail = s;
                      print(UserEmail);


                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  key: _formKeyPassword,
                  autovalidateMode: AutovalidateMode.always ,
                  validator: (f) {
                    if(ValidEmail)
                      return !isCivPressed? 'Invalid MOI number or password' : 'Invalid email address or password';
                    return null;
                  },
                  obscureText: true,
                  onChanged: (String s) {
                    setState(() {
                      UserPass = s;
                      print(UserPass);


                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true))
            ],
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  // Container(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   alignment: Alignment.centerRight,
                  //   child: Text('Forgot Password ?',
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.w500)),
                  // ),
                  _divider(),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
  void SignIn( String email,
      String password, BuildContext ctx) async {
    UserCredential authResult;
    try {
      print(email);
      setState(() {
        isLoading = true;
        ValidEmail = false;
      });



      authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );



        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => MainPage()),);


    } on PlatformException catch (err) {
      String? message = 'An error occurred, please check your credentials!';

      if (err.message != null) {
        message = err.message;

        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text(message!),
            backgroundColor: Theme
                .of(ctx)
                .errorColor,
          ),
        );
      }
      setState(() {
        isLoading = false;
        ValidEmail = true;
      });
    } catch (err) {
      print(err);
      setState(() {
        isLoading = false;
        ValidEmail = true;
      });
    }
  }
}
