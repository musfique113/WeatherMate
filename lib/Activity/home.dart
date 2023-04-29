import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=0dadc0ec41869d72cab605ebf70d5c96"));
    Map data = jsonDecode(response.body);
    //print(data);
    Map temp_data = data['main'];
    var temp = temp_data['temp'];
    print(temp);

    // // this api form weatherApi.com
    // Response response = await get(Uri.parse(
    //     "https://api.weatherapi.com/v1/current.json?key=697dbef7df384b00bd5165247232804&q=Dhaka&aqi=no}"));
    // Map data = jsonDecode(response.body);
    // Map temp_data = data['current'];
    // var locationName = temp_data['temp_c'];
    // print(locationName);
  }

  int counter = 1;
  @override
  void initState() {
    getData();
    //showData();
    //timer();
    // TODO: implement initState
    super.initState();
    print("This is an init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Disposed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
      ),
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => setState(() {
              counter += 1;
            }),
          ),
          Text("$counter")
        ],
      ),
    );
  }
}
