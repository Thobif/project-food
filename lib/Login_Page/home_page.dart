import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Lonin Success"),
        // Text(user.email!),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            label: const Text("Logout"))
      ]),
    );
  }
}
