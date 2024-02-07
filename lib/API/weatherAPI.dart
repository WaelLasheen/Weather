import 'package:weather/Models/weatherAPIModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherAPI {
  Future<weatherAPIModel> featchData(String city) async {
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=e44153a85d007475124dc275d3c04e6d";
    
    final respond = await http.get(Uri.parse(url));

    if (respond.statusCode == 200) {
      var data = jsonDecode(respond.body);
      return weatherAPIModel.fromJson(data);
    }

    throw Exception("Error : ${respond.statusCode}");
  }
}
