import 'dart:convert';
import 'package:senior_project/classes/user.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project/constants.dart';

Future<User> register(
    name, username, email, password, phone, location, photo) async {
  User list;
  var response = await http.post(Uri.parse(host + "/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'location': location,
        'phone': phone,
        'photo': photo
      }));
  if (response.statusCode == 201) {
    Map<String, dynamic> user = json.decode(response.body)['result'];
    print(user);
    list = User.fromJson(user);
    print(list);
    return list;
  } else {
    throw Exception('Failed to create user');
  }
}
