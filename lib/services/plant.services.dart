import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/constants.dart';

class PlantService {
  Future<List<Plant>> getAllPlants() async {
    List<Plant> list;
    var response = await http.post(
      Uri.parse(host + "/getPlants"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      var plants = json.decode(response.body)['plants'];
      list = Plant.getAllPlants(plants);
      return list;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return null;
    }
  }

  Future<List<SavedPlant>> getAllSavedPlants(int userid) async {
    List<SavedPlant> list;
    var response = await http.post(Uri.parse(host + "/getSavedPlants"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'userid': userid,
        }));
    if (response.statusCode == 201) {
      var plants = json.decode(response.body)['plants'];
      list = SavedPlant.getAllPlants(plants);
      return list;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return null;
    }
  }

  Future<Plant> getPlant(int idplant) async {
    Plant plant;
    var response = await http.post(Uri.parse(host + "/getPlant"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'plantid': idplant,
        }));
    if (response.statusCode == 201) {
      var result = json.decode(response.body)['plant'];
      plant = Plant.fromJson(result);
      return plant;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return null;
    }
  }
}
