import 'package:flutter/material.dart';
import 'package:weather_mate/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String Temperature = 'Loading';

  String temp = '';
  String hum = '';
  String air_speed = '';
  String des = '';
  String main = '';
  void startApp() async {
    worker instance = worker(location: "Dhaka");
    await instance.getData();
    print(instance.airSpeed);
    // print(instance.description);
    // print(instance.humidity);
    // print(instance.location);
    // print(instance.temp);

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.humidity;
    des = instance.description;
    main = instance.main;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value":temp,
      "hum_value": hum,
      "des_value": des,
      "main_value":main,
      "air_speed_value":air_speed
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Loading")),
    );
  }
}
