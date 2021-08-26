class User {
  final String id;
  final String name;
  final String username;
  final String password;
  final String optionalContact;
  final String region;
  final String major;

  User({
    this.id,
    this.name,
    this.username,
    this.optionalContact,
    this.password,
    this.region,
    this.major,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['iduser'],
      name: json['name'],
      username: json['username'],
      optionalContact: json["optionalContact"],
      password: json["password"],
      region: json["region"],
      major: json["type"],
    );
  }
}
