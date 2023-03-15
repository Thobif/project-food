import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        Text("Login Page"),
        TextFormField(
          // ignore: prefer_const_constructors
          decoration: InputDecoration(label: Text("Email")),
          controller: emailController,
        ),
        TextFormField(
          // ignore: prefer_const_constructors
          decoration: InputDecoration(label: Text("Password")),
          controller: passwordController,
        ),
        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.lock_open), label: Text("Login"))
      ],
    );
  }
}
