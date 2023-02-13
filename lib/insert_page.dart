import 'package:api_flutter/display_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(label: Text("Name")),
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(label: Text("Age")),
          ),
          ElevatedButton(
              onPressed: () {
                Map<String, String> user = {
                  'name': nameController.text,
                  'age': ageController.text
                };
                dbRef.push().set(user);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Display()));
              },
              child: Text("Insert"))
        ],
      )),
    );
  }
}
