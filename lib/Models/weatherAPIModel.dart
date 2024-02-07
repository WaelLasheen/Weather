import 'city.dart';
import 'lista.dart';

class weatherAPIModel {
  String? cod;
  int? message;
  int? cnt;
  List<Lista>? list;
  City? city;

  weatherAPIModel({this.cod, this.message, this.cnt, this.list, this.city});

  weatherAPIModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Lista>[];
      json['list'].forEach((v) {
        list!.add(Lista.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'cod': this.cod,
      'message': this.message,
      'cnt': this.cnt,
      'list': list != null ? this.list!.map((v) => v.toJson()).toList() : null,
      'city': city != null ? this.city!.toJson() : null,
    };
    return data;
  }
}
