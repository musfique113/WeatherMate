import 'package:flutter/material.dart';
import 'package:weather_mate/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String Temperature = 'Loading';

  void startApp() async {
    worker instance = worker(location: "Dhaka");
    await instance.getData();
    setState(() {
      Temperature = instance.temp;
    });
    print(instance.airSpeed);
    // print(instance.description);
    // print(instance.humidity);
    // print(instance.location);
    // print(instance.temp);
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
        body: SafeArea(
      child: Column(
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              icon: Icon(Icons.add_to_home_screen),
              label: Text(Temperature))
        ],
      ),
    ));
  }
}
