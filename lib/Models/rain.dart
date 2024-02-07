class Rain {
  double? d3h;

  Rain({this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'] /1.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'3h': this.d3h};
    return data;
  }
}
