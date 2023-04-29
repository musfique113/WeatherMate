import 'package:http/http.dart';
import 'dart:convert';

import 'package:weather_mate/Activity/location.dart';

class worker {
  String location = '';

  worker({required this.location}) 
  {
    location = this.location;
  }
  String temp = '';
  String humidity = '';
  String airSpeed = '';
  String description = '';
  String main = '';

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0dadc0ec41869d72cab605ebf70d5c96"));
    Map data = jsonDecode(response.body);
    //print(data);

    //Getting Temp,Humidity
    Map temp_data = data['main'];
    String getTemp = temp_data['temp'].toString();
    String getHumidity = temp_data['humidity'].toString();
    //print(temp);

    //Air speed
    Map wind = data['wind'];
    String getAir_speed = wind['speed'].toString();

    //getting despription
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String getMain_des = weather_main_data['main'];
    String getDesc = weather_main_data['description'];
    //print(weather_data);
    //print(weather_main_data['main']);

    // // this api form weatherApi.com
    // Response response = await get(Uri.parse(
    //     "https://api.weatherapi.com/v1/current.json?key=697dbef7df384b00bd5165247232804&q=Dhaka&aqi=no}"));
    // Map data = jsonDecode(response.body);
    // Map temp_data = data['current'];
    // var locationName = temp_data['temp_c'];
    // print(locationName);

    //assigning values
    temp = getTemp;
    humidity = getHumidity;
    airSpeed = getAir_speed;
    description = getDesc;
    main = getMain_des;
  }
}

