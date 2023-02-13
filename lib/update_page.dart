import 'package:api_flutter/display_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key, required Map this.data});
  final Map data;
  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
    getdata();
  }

  void getdata() {
    nameController.text = widget.data['name'];
    ageController.text = widget.data['age'];
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
                dbRef.child(widget.data['key']).update(user);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Display()));
              },
              child: Text("Update Data"))
        ],
      )),
    );
  }
}
