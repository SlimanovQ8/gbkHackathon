import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gbk_hackathon/pages/MainPage.dart';
import 'package:gbk_hackathon/pages/SignUpPage.dart';
import 'package:gbk_hackathon/pages/addKid.dart';
import 'package:gbk_hackathon/pages/add_challenge.dart';
import 'package:gbk_hackathon/pages/add_expenses.dart';
import 'package:gbk_hackathon/pages/all_events.dart';
import 'package:gbk_hackathon/pages/allexpenses.dart';
import 'package:gbk_hackathon/pages/loginPage.dart';
import 'package:gbk_hackathon/pages/welcomingpage.dart';
import 'package:gbk_hackathon/theme.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import 'pages/add_event.dart';
import 'pages/kiddetail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: myTheme,
    );
  }

  final _router = GoRouter(initialLocation: "/", routes: [
    GoRoute(path: "/", builder: (context, state) => WelcomePage()),
    GoRoute(path: "/homepage", builder: (context, state) => MainPage()),
    GoRoute(path: "/page", builder: (context, state) => MyHomePage()),
    GoRoute(path: "/signIn", builder: (context, state) => LoginPage()),
    GoRoute(path: "/signUp", builder: (context, state) => SignUpPage()),
    GoRoute(path: "/addkid", builder: (context, state) => AddKid()),
    GoRoute(path: "/kiddetail", builder: (context, state) => KidDetail()),
    GoRoute(path: "/addexpense", builder: (context, state) => AddExpenses()),
    GoRoute(path: "/allexpenses", builder: (context, state) => AllExpenses()),
    GoRoute(path: "/addchallenge", builder: (context, state) => AddChallenge()),
    GoRoute(path: "/allevents", builder: (context, state) => AllEvents()),
    GoRoute(path: "/addevent", builder: (context, state) => AddEvent()),
  ]);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapSh0ot) {
          if (userSnapSh0ot.hasData) {
            user = FirebaseAuth.instance.currentUser!.email!;
            print("ffdc" + user);

            return MainPage();
          }
          return LoginPage();
        });
  }
}

String user = "";
