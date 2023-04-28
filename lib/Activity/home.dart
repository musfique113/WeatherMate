import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void getData() async{
    Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=dhaka&appid=0dadc0ec41869d72cab605ebf70d5c96}"));
    //Response response =await get("https://mytimeapi.herokuapp.com/time/Asia/Kolkata" as Uri);
    print(response.body);
  }
  // var ff;
  //
  // void getData() async{
  //   await Future.delayed(Duration(seconds: 5),(){
  //     ff = "Test f";
  //   });
  //   print(ff);
  // }
  //
  // void showData() async{
  //   getData();
  //   print(ff);
  // }

  // void timer(){
  //   //timer for 5 second
  //   Future.delayed(Duration(seconds: 5),(){
  //     print("Arlame is going on");
  //   });
  //   print("Do onther stuf");
  // }

  int counter = 1 ;
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
      body:
          Column(
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
