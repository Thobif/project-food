import 'package:api_flutter/Login_Page/home_page.dart';
import 'package:api_flutter/Login_Page/login_page.dart';
import 'package:api_flutter/display_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Display extends StatelessWidget {
  const Display({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');

      

  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _priceController = TextEditingController();

  // Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //     _nameController.text = documentSnapshot['name'];
  //     _priceController.text = documentSnapshot['price'];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: user.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> steamSnapshot) {
          if (steamSnapshot.hasData) {
            return ListView.builder(
              itemCount: steamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    steamSnapshot.data!.docs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ชื่อ " +
                       documentSnapshot['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     Text(
                     "อายุ " + documentSnapshot['age'].toString() ,
                      style: TextStyle(fontSize: 14),
                    ),
                    
                   
                  ],
                );
                // Card(
                //   margin: const EdgeInsets.all(10),
                //   child: ListTile(
                //     title: Text(documentSnapshot['name']),
                //     subtitle: Text(documentSnapshot['price'].toString()),
                //   ),

                // );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          body: TabBarView(
            children: [
              HomePage(),

            ],
            ),
            backgroundColor: Colors.blue,
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(text: "รายการอาหาร",),
                
                
              ],
              ),
        ),
        );
  }
}


