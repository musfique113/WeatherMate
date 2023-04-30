import 'dart:convert';
import 'dart:math';

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
    //Map info = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    var cityName = ["Dhaka", "Rangpur", "Panchagarh", "Dinajpur", "Chittagong", "Cox's Bazar", "Khulna", "Jessore", "Rajshahi", "Natore", "Bogra", "Narayanganj", "Narsingdi", "Mymensingh", "Comilla", "Bhola", "Noakhali", "Barisal", "Patuakhali", "Jhenaidah", "Moulvibazar"];
    final _random = new Random();
    var city = cityName[_random.nextInt(cityName.length)];
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container( //this is the serarch contailer
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Row(
                  children: [
                    GestureDetector(
                    onTap: (){},
                      child: Container(child: Icon(Icons.search, color: Colors.greenAccent,),margin: EdgeInsets.fromLTRB(4, 0, 8, 0),),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city"
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
