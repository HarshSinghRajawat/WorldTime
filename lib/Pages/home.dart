import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    print(data);

    //set Background
    String bgImg=data['isDayTime']?'day.png':'night.png';
    Color bgColor=data['isDayTime']?Colors.blue:Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,

          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location,color: Colors.grey[300],size: 35,),
                label: Text('Edit Location',style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 2,
                    color: Colors.white
                ),),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66, color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
              Text(
                data['date'],
                style: TextStyle(
                  fontSize: 20,
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
