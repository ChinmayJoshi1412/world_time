import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;//location name
  late String time;// time in that location
  var flag;
  late String endpoint;// location api endpoint
  late bool isDaytime;//true or false if daytime or not
  WorldTime(this.location,this.endpoint,this.flag);
  Future <void> getTime() async {
    var url =   Uri.parse('https://worldtimeapi.org/api/timezone/$endpoint');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
    String datetime = data['datetime'];
    String offset_hours = data['utc_offset'].substring(1,3);
    String offset_minutes = data['utc_offset'].substring(4);
    //print(datetime);
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset_hours),minutes: int.parse(offset_minutes)));
    //set time property
    isDaytime = now.hour >6 && now.hour <18 ? true : false;
    print(isDaytime);
    time = DateFormat.jm().format(now);
  }

}
