import 'package:aklny/utils/shared_preferences.dart';

class UserModel {
  String firstName;
  String lastName;
  String email;
  String phone;
  int id;
  String img;

  UserModel({
    this.phone,
    this.firstName,
    this.lastName,
    this.email,
    this.id,
    this.img,
  });

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    phone = json["phone"];
    email = json["email"];
    id = json['id'];
    img = json['img'];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'img': img,
    };
  }

  static Future<void> setToken(String token) async {
    ShopSharedPreference.setData(key: 'token', value: token);
  }

  static Future<String> getToken() async {
    return ShopSharedPreference.getData(key: 'token');
  }

  static Future<bool> get isLoggedIn async => await getToken() != null;
}
