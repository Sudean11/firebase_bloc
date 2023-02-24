import 'dart:convert';

List<ApiData> welcomeFromJson(String str) =>
    List<ApiData>.from(json.decode(str).map((x) => ApiData.fromJson(x)));

String welcomeToJson(List<ApiData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiData {
  ApiData({
    required this.id,
    required this.firstName,
    required this.image,
  });

  int id;
  String firstName;
  String image;

  factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
        id: json["id"],
        firstName: json["first_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "image": image,
      };
}
