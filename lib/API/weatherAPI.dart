import 'package:geolocator/geolocator.dart';
import 'package:weather/Models/weatherAPIModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/location/location.dart';

class WeatherAPI {
  Future<weatherAPIModel> featchData(String city) async {
    
    Position position = await determinePosition();
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    String API_key="e44153a85d007475124dc275d3c04e6d";
    String url =
      city==""?
        "https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=${API_key}" :
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=${API_key}";


    final respond = await http.get(Uri.parse(url));

    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      return weatherAPIModel.fromJson(data);
    }

    throw Exception("Error : ${respond.statusCode}");
  }
}
