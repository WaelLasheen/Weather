import 'package:weather/Models/rain.dart';
import 'package:weather/Models/sys.dart';
import 'package:weather/Models/weather.dart';
import 'package:weather/Models/wind.dart';

import 'Main.dart';
import 'cloud.dart';

class Lista {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  String? dtTxt;
  Rain? rain;

  Lista(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt,
      this.rain});

  Lista.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop']/1.0;   // to be double 0^0
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'dt': this.dt,
      'main': main != null ? this.main!.toJson() : null,
      'weather': weather != null
          ? this.weather!.map((v) => v.toJson()).toList()
          : null,
      'clouds': clouds != null ? this.clouds!.toJson() : null,
      'wind': wind != null ? this.wind!.toJson() : null,
      'visibility': this.visibility,
      'pop': this.pop,
      'sys': sys != null ? this.sys!.toJson() : null,
      'dt_txt': this.dtTxt,
      'rain': rain != null ? this.rain!.toJson() : null,
    };
    return data;
  }
}
