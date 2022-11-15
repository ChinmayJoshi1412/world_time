import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isdaytime'] ? 'day.png':'night.png';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context,'/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime ': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit Location'),
                  style: TextButton.styleFrom(
                    primary: Colors.black
                  ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                      ),)
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style:TextStyle(
                      fontSize: 66
                    )
                  )
                ],
              ),
            ),
      )
    );
  }
}
