class Flower {
  int? id;
  String? firstName;
  String? image;

  Flower({this.id, this.firstName, this.image});

  Flower.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['image'] = this.image;
    return data;
  }
}
