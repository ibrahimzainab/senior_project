class User {
  int id;
  String name;
  String birthDate;
  String username;
  String password;
  String email;
  String phone;
  String region;
  String major;

  static final User user = User._internal();

  User._internal();

  factory User(Map<String, dynamic> json) {
    user.id = json['iduser'];
    user.name = json['name'];
    user.username = json['username'];
    user.birthDate = json['birthDate'];
    user.phone = json['phone'];
    user.email = json['email'];
    user.password = json['password'];
    user.region = json['region'];
    user.major = json['major'];
    print("HEYYYY ${json['name']}");
    return user;
  }
}
