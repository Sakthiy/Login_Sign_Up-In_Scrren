import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key, required email, required password,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var password;

  var email;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(32),
        children: [
          Text('Email: $email'),
          SizedBox(
            height: 16,
          ),
          Text('Password: $password'),
        ],
      ),),
  );
}
