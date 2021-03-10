import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/webapi.dart';

const apiKey = "6419aa902d1c1e9b9939c0c7671babed";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  getWeatherData() async{
    var loc = new Location();
    await loc.getCurrentLocation();

    var webapi = new WebAPIHelper(url:"http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=${apiKey}&units=metric");
    var wd = await webapi.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return weatherScreen(weatherData: wd,);
    }));
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}


