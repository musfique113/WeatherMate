import 'dart:convert';
import 'dart:math';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'loading.dart';

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
    var cityName = [
      "Dhaka",
      "Rangpur",
      "Panchagarh",
      "Dinajpur",
      "Chittagong",
      "Cox's Bazar",
      "Khulna",
      "Jessore",
      "Rajshahi",
      "Natore",
      "Bogra",
      "Narayanganj",
      "Narsingdi",
      "Mymensingh",
      "Comilla",
      "Bhola",
      "Noakhali",
      "Barisal",
      "Patuakhali",
      "Jhenaidah",
      "Moulvibazar"
    ];
    final _random = new Random();
    var city = cityName[_random.nextInt(cityName.length)];
    Map info =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    String temp = (((info['temp_value']).toString()).substring(0, 4));
    String icon = info['icon_value'];
    String humidity = (info['hum_value']);
    String wind = (((info['air_speed_value']).toString()).substring(0, 4));
    String cityX = info['city_value'];
    String des = info['des_value'];

    //String humidity = (((info['hum_value']).toString()).substring(0,4));
    // String wind = (((info['air_speed_value']).toString()).substring(0,4));
    //String wind = (((info['air_speed_value']).toString()).substring(0,4));

    // temp_value":temp,
    //   "hum_value": hum,
    //   "des_value": des,
    //   "main_value":main,
    //   "air_speed_value":air_speed

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.lightBlueAccent,
              ], // Close the list of colors with a square bracket
            ),
          ),
          child: Column(
            children: [
              Container(
                //this is the serarch contailer
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        margin: EdgeInsets.fromLTRB(4, 0, 8, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search $city"),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      margin: EdgeInsets.symmetric(horizontal: 17),
                      padding: EdgeInsets.all(30),
                      child: Row(children: [
                        Image.network(
                          "https://openweathermap.org/img/wn/$icon@2x.png",
                          scale: 1.0,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            Text(
                              "$des".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "in $cityX",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                      padding: EdgeInsets.all(30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.wiThermometer),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(fontSize: 65),
                                ),
                                Text("°C", style: TextStyle(fontSize: 60)),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(30),
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wiDayWindy),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("$wind",
                              style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("KM/h"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(30),
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wiHumidity),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("$humidity",
                              style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Percent"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("Data provided by Opernwathermap.org")],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
