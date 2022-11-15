import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setupworldtime() async
  {
    WorldTime instance = WorldTime('Kolkata','Asia/Kolkata','india.jpg');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isdaytime' : instance.isDaytime
    } );
  }
  @override
  void initState() {
    super.initState();
    setupworldtime();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
            child: SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            ),
        )
      ),
    );
  }
}
