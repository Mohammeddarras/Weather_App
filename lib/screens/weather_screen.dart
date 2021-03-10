import 'package:flutter/material.dart';
import 'package:weather/screens/city_location.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:weather/services/weatherCond.dart';
import 'package:weather/services/webapi.dart';

class weatherScreen extends StatefulWidget {
  weatherScreen({this.weatherData});

  final weatherData;

  @override
  _weatherScreenState createState() => _weatherScreenState();
}

class _weatherScreenState extends State<weatherScreen> {
  var w = WeatherModel();
  int temp;
  String message;
  String weatherIcon;

  showDataOnUI(dynamic weath) {
    setState(() {
      double t = weath['main']['temp'];
      temp = t.toInt();
      message = w.getMessage(temp);

      var cond = weath['weather'][0]['id'];
      weatherIcon = w.getWeatherIcon(cond);
    });
  }

  @override
  void initState() {
    super.initState();
    showDataOnUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/location_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6), BlendMode.dstATop),
        )),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                      onPressed: () {
                        showDataOnUI(widget.weatherData);
                      },
                      child: Icon(Icons.near_me, size: 50,)),
                  FlatButton(
                      onPressed: () async {
                        var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CityLocation();
                        }));
                        if(cityName != null){
                          var w =  WebAPIHelper(url: 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
                          var weatherData = await w.getData();
                          showDataOnUI(weatherData);
                        }
                      },
                      child: Icon(Icons.location_city, size: 50,)),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      '$temp',
                      style: TextStyle(fontFamily: 'Spartan MB', fontSize: 100),
                    ),
                    Text(
                      '$weatherIcon',
                      style: TextStyle(fontSize: 100),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  '$message',
                  style: TextStyle(fontFamily: 'Spartan MB', fontSize: 60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
