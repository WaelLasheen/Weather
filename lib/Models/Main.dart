class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] / 1.0;
    feelsLike = json['feels_like'] / 1.0;
    tempMin = json['temp_min'] /1.0;
    tempMax = json['temp_max'] / 1.0;
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'] / 1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'temp': this.temp,
      'feels_like': this.feelsLike,
      'temp_min': this.tempMin,
      'temp_max': this.tempMax,
      'pressure': this.pressure,
      'sea_level': this.seaLevel,
      'grnd_level': this.grndLevel,
      'humidity': this.humidity,
      'temp_kf': this.tempKf,
    };
    return data;
  }
}
