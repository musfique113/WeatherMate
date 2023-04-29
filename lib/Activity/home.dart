import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
      ),
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
          ),
          Text(info["temp_value"]),
          Text(info["main_value"]),
        ],
      ),
    );
  }
}
