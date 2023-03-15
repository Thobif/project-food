import 'package:api_flutter/display_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});
 
  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  @override
  void initState() {
    super.initState();
     
  }
  void _addUserDataToFirestore(String name ,String age) async {
  await _firestore.collection('user').add({'name': name , 'age': age });
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
      _addUserDataToFirestore(nameController.text, ageController.text);
  
    
  },
  child: Text('Add'),
)
        ],
      )),
    );
  }
}
