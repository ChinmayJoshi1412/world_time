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

    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    print(data);
    String bgImage = data['isdaytime'] ? 'day.png':'night.png';
    var color = data['isdaytime'] ? Colors.blue[800]:Colors.indigo[900];
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
              padding: const EdgeInsets.fromLTRB(40,120,40,430),
              child: Card(
                shadowColor: Colors.black,
                color: color,
                elevation: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    ElevatedButton.icon(
                        onPressed: () async{
                          dynamic result = await Navigator.pushNamed(context,'/location');
                          setState(() {
                            data = result;
                          });
                        },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      primary: Colors.white,
                      elevation: 20,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data['location'],style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),)
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      data['time'],
                      style:TextStyle(
                        fontSize: 66,
                        color: Colors.white
                      )
                    )
                  ],
                ),
              ),
            ),
      )
    );
  }
}
