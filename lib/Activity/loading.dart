import 'package:flutter/material.dart';
import 'package:weather_mate/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  String icon = '';
  String city = 'Dhaka';

  void startApp() async {
    worker instance = worker(location: city);
    await instance.getData();
    // print(instance.airSpeed);
    // print(instance.description);
    // print(instance.humidity);
    // print(instance.location);
    // print(instance.temp);

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;




    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "des_value": des,
        "main_value": main,
        "air_speed_value": air_speed,
        "icon_value" : icon,
        "city_value" : city
      });
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Image.asset(
              "images/icon.png",
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "WeatherMate",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            SpinKitThreeBounce(
              color: Color(0xFFDBEEFF),
              size: 30.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
