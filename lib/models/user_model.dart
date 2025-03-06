import "dart:convert";

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.type,
      required this.token});

//storing data in database
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "address": address,
      "type": type,
      "token": token,
    };
  }

  //retrieving data from database

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map["_id"] ?? "",
        name: map["name"] ?? "",
        email: map["email"] ?? "",
        password: map["password"] ?? "",
        address: map["address"] ?? "",
        type: map["type"] ?? "",
        token: map["token"] ?? " ");
  }

// convert to json for storing in database
  String toJson() => json.encode(toMap());

  // convert from json for retrieving from database
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
