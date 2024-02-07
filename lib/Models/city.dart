import 'coord.dart';

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': this.id,
      'name': this.name,
      'coord': coord != null ? this.coord!.toJson() : null,
      'country': this.country,
      'population': this.population,
      'timezone': this.timezone,
      'sunrise': this.sunrise,
      'sunset': this.sunset,
    };
    return data;
  }
}
