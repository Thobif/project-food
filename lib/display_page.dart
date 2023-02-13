import 'package:api_flutter/insert_page.dart';
import 'package:api_flutter/update_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({super.key});
  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  Query refQ = FirebaseDatabase.instance.ref().child('users');
  DatabaseReference refD = FirebaseDatabase.instance.ref().child('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
        query: refQ,
        itemBuilder: (context, snapshot, animation, index) {
          Map userMap = snapshot.value as Map;
          userMap['key'] = snapshot.key;
          return ShowDisplay(userMap: userMap);
        },
      )),
      floatingActionButton: IconButton(iconSize: 50,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => Insert())));
        },
        icon: Icon(Icons.add),
      ),
    );
  }

  Widget ShowDisplay({required Map userMap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userMap['name'],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(userMap['age'], style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdatePage(
                          data: userMap,
                        ),
                      ));
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      refD.child(userMap['key']).remove();
                    },
                    icon: Icon(Icons.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
