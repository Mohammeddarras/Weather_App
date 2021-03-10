import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  getCurrentLocation () async{
    try{
      var pos = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = pos.latitude;
      longitude = pos.longitude;
    }catch(e){
      print(e) ;
    }
  }

}