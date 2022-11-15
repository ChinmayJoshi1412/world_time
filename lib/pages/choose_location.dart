import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime('Mumbai','Asia/Kolkata','india.jpg'),
    WorldTime('London','Europe/London','uk.png'),
    WorldTime('Berlin','Europe/Berlin','germany.png'),
    WorldTime('Cairo','Africa/Cairo','egypt.png'),
    WorldTime('Sydney','Australia/Sydney','australia.png'),
    WorldTime('New York','America/New_York','usa.png'),
    WorldTime('Jakarta','Asia/Jakarta','indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isdaytime' : instance.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: locations.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
      },),
    );
  }
}
