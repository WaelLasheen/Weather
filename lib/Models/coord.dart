class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] / 1.0;
    lon = json['lon'] /1.0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'lat': this.lat,
      'lon': this.lon,
    };
    return data;
  }
}
