import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityLocation extends StatefulWidget {
  @override
  _CityLocationState createState() => _CityLocationState();
}

class _CityLocationState extends State<CityLocation> {

  String cityname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(
             image: AssetImage('images/city_background.jpg'),
           fit: BoxFit.cover,
         ),
       ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city, color: Colors.white,),
                    hintText: 'Enter City',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (value){
                    cityname = value;
                  },
                ),
              ),
              FlatButton(onPressed: (){
                Navigator.pop(context, cityname);
              },
                child: Text('Weather is : ', style: TextStyle(fontSize: 30, fontFamily: 'Spartan MB'),)
              ),
            ],
          ),
        ),
        ),
    );
  }
}
