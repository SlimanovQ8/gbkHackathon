import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gbk_hackathon/main.dart';

import '../classes/CustomAnimatedBottomBar.dart';
import 'loginPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

Future<String> getUserRealName() async {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  print("ID =" + uid);

  final result =
      await FirebaseFirestore.instance.collection('Users').doc(uid).get();

  FirebaseMessaging.instance.getToken().then((token) {
    print("token $token");
    print(token);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'deviceID': token,
      'zz': "fv",
    });
  });
  return result.get('Name');
}

class _MainPageState extends State<MainPage> {
  String userEmail = FirebaseAuth.instance.currentUser!.email!;
  String use = FirebaseAuth.instance.currentUser!.uid;
  var userName = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .id;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessageOpenedAgvgfpp data: ${message.data}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(message.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedfApp data: ${message.data}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(message.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double TitleFontSize = unitHeightValue * 2.4;
    double BodyFontSize = unitHeightValue * 2.0;
    final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 4.2;
    final double itemWidth = size.width / 2;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: NestedScrollView(
        // Setting floatHeaderSlivers to true is required in order to float
        // the outer slivers over the inner scrollable.
        floatHeaderSlivers: true,
        /*i think the sliver bar here is not needed*/
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                automaticallyImplyLeading: false,
                //expandedHeight: 50, // or 215
                floating: true,
                snap: true,
                pinned: false,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: SafeArea(
                    child: Container(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hi Family Name Here',

                              ),
                              Container(

                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                )),
          ];
        },
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [Colors.orange, Colors.pink]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "Total Saving",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "1500 KD",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            "Current Month Expenses",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "1500 KD",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text("My Kids"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        8,
                        (index) => Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: new CircleAvatar(
                                      maxRadius: 44,
                                      minRadius: 44,
                                      child: Image.asset( index == 7?
                                        "assets/icons/add.png" : "assets/icons/event.png",
                                        width: 40,
                                        height: 40,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      backgroundColor: Colors.white),
                                  padding:
                                      const EdgeInsets.all(1.0), // borde width
                                  decoration: new BoxDecoration(
                                    color:
                                        const Color(0x231873e8), // border color
                                    shape: BoxShape.circle,
                                  )),
                              Flexible(
                                child: Padding(
                                  child: Text(index == 7? "Add Event" :"Events",
                                      style: const TextStyle(
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "AvenirNext",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12)),
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              )
            ])),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white70,
                      child: Stack(
                        children: [
                          Positioned(
                            left: TitleFontSize * 5.75,
                            top: TitleFontSize * 4.25,
                            child: ImageIcon(
                              AssetImage("assets/icons/event.png"),
                              color: Color(0xFFCACACA),
                              size: TitleFontSize * 4,
                            ),
                          ),
                          ClipOval(
                            child: Material(
                              color: Colors.redAccent, // Button color
                              child: SizedBox(
                                  width: TitleFontSize * 3.5,
                                  height: TitleFontSize * 3.5,
                                  child: ImageIcon(
                                    AssetImage("assets/icons/event.png"),
                                    size: 0,
                                    color: Color.fromARGB(255, 230, 230, 230),
                                  )),
                            ),
                          ),
                          Positioned(
                            left: TitleFontSize * 0,
                            bottom: 0,
                            top: TitleFontSize * 3.75,
                            right: 0,
                            child: Text(
                              "Events",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: TitleFontSize * 0,
                            bottom: 0,
                            top: TitleFontSize * 5.25,
                            right: 0,
                            child: Text(
                              "service_",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 80.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.white,
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 12,
        curve: Curves.ease,

        onItemSelected: (index) => setState(() => currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).dividerColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.event),
            title: Text('Events'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).dividerColor,
            textAlign: TextAlign.center,
          ),

          BottomNavyBarItem(
            icon: Icon(Icons.task),
            title: Text(
              'Challenges',
            ),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).dividerColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('setting'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).dividerColor,
            textAlign: TextAlign.center,
          ),
        ],
      )
      ,
    );

  }
  int currentIndex= 0;
}
