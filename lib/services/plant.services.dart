import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project/classes/article.dart';
import 'package:senior_project/classes/disease.dart';
import 'package:senior_project/classes/insect.dart';
import 'package:senior_project/classes/note.dart';
import 'package:senior_project/classes/plant.dart';
import 'package:senior_project/classes/savedPlant.dart';
import 'package:senior_project/classes/user.dart';
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

  Future<List<Article>> getArticles() async {
    List<Article> articles;
    var response = await http.post(
      Uri.parse(host + "/getArticles"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      var articlesJson = json.decode(response.body)['articles'];
      articles = Article.getArticles(articlesJson);
      return articles;
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

  Future<List<Insect>> getRelatedInsects(int idplant) async {
    List<Insect> list;
    var response = await http.post(Uri.parse(host + "/getRelatedInsects"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'idplant': idplant,
        }));
    if (response.statusCode == 201) {
      var insectsJson = json.decode(response.body)['insects'];
      list = Insect.getInsects(insectsJson);
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

  Future<List<Article>> getRelatedArticles(int idplant) async {
    List<Article> list;
    var response = await http.post(Uri.parse(host + "/getRelatedArticles"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'idplant': idplant,
        }));
    if (response.statusCode == 201) {
      var articlesJson = json.decode(response.body)['articles'];
      list = Article.getArticles(articlesJson);
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

  Future<List<Disease>> getRelatedDiseases(int idplant) async {
    List<Disease> list;
    var response = await http.post(Uri.parse(host + "/getRelatedDiseases"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'idplant': idplant,
        }));
    if (response.statusCode == 201) {
      var diseasesJson = json.decode(response.body)['diseases'];
      list = Disease.getDiseases(diseasesJson);
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

  Future<bool> addToGarden(String addedName, int plantid, int userid) async {
    var response = await http.post(Uri.parse(host + "/addToGarden"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'addedName': addedName,
          'plantid': plantid,
          'userid': userid,
        }));
    if (response.statusCode == 201) {
      //Map<String, dynamic> user = json.decode(response.body)['result'];
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return false;
    }
  }

  Future<bool> addNote(String description, String imagePath, int reminder,
      int scheduleid, String title, int savedPlantid) async {
    var response = await http.post(Uri.parse(host + "/addNote"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'description': description,
          'imagePath': imagePath,
          'reminder': reminder,
          'scheduleid': scheduleid,
          'title': title,
          'savedplantid': savedPlantid,
        }));
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Note successfully added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return false;
    }
  }

  Future<int> addSchedule(DateTime startDate, int frequencyInterval,
      DateTime timeOfDay, DateTime endDate) async {
    var response = await http.post(Uri.parse(host + "/addToGarden"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'startDate': startDate,
          'frequencyInterval': frequencyInterval,
          'timeOfDay': timeOfDay,
          'endDate': endDate,
        }));
    if (response.statusCode == 201) {
      int scheduleid = json.decode(response.body)['scheduleid'];
      return scheduleid;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return 0;
    }
  }

  Future<List<Note>> getNotes(int savedplantid) async {
    List<Note> list;
    var response = await http.post(Uri.parse(host + "/getNotes"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'savedplantid': savedplantid,
        }));
    if (response.statusCode == 201) {
      var noteJson = json.decode(response.body)['notes'];
      list = Note.getNotes(noteJson);
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

  Future<List<Note>> getAllNotes() async {
    List<Note> list;
    var response = await http.post(Uri.parse(host + "/getAllNotes"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'userid': User.user.id}));
    if (response.statusCode == 201) {
      var noteJson = json.decode(response.body)['notes'];
      list = Note.getNotes(noteJson);
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

  Future<bool> editNote(int noteid, String title, String text) async {
    var response = await http.post(Uri.parse(host + "/editNote"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'noteid': noteid,
          'title': title,
          'description': text
        }));
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Note successfully edited",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return false;
    }
  }

  Future<bool> deleteNote(int noteid) async {
    var response = await http.post(Uri.parse(host + "/deleteNote"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'noteid': noteid,
        }));
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Note successfully deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return false;
    }
  }

  Future<bool> deleteSavedPlant(int idsavedplant) async {
    var response = await http.post(Uri.parse(host + "/deleteSavedPlant"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'idsavedplant': idsavedplant,
        }));
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Plant successfully deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Unexpected error has occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: kPrimaryColor,
          textColor: kPrimaryLightColor,
          fontSize: 16.0);
      return false;
    }
  }
}
