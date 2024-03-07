class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final Data data;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.status,
    required this.image,
    required this.accessToken,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String email;
  late final String status;
  late final String image;
  late final String accessToken;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    image = json['image'] ?? '';
    accessToken = json['access_token'];
  }
}
