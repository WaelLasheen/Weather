class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'] /1.0;
    deg = json['deg'];
    gust = json['gust'] /1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'speed': this.speed,
      'deg': this.deg,
      'gust': this.gust
    };
    return data;
  }
}
