import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:senior_project/classes/user.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project/constants.dart';

class AuthService {
  Future<User> register(
      name, username, password, birthDate, email, phone, region, major) async {
    User list;
    var response = await http.post(Uri.parse(host + "/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'birthDate': birthDate,
          'username': username,
          'password': password,
          'region': region,
          'email': email,
          'phone': phone,
          'major': major,
        }));
    if (response.statusCode == 201) {
      Map<String, dynamic> user = json.decode(response.body)['result'];
      print(user);
      list = User(user);
      print(list);
      return list;
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<User> login(email, password) async {
    User list;
    var response = await http.post(Uri.parse(host + "/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': email,
          'password': password,
        }));
    if (response.statusCode == 201) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();// var parse = jsonDecode(response.body);// await prefs.setString('token', parse["token"]);
      var user = json.decode(response.body)['user'];
      print(json);
      list = User(user);
      return list;
    } else {
      print("HEYYY $password");
      Fluttertoast.showToast(
          msg: json.decode(response.body)['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return null;
    }
  }
}
