import 'package:flutter/material.dart';

class Plant{
  int id;
  String name,family,description,image,watering;
  List<String> takingCare,howToPlant;
  //List<Insect> insects;
  // List<Article> articles;
  //List<Disease> diseases;

  Plant({
    @required this.id,
    @required this.name,
    @required this.family,
    @required this.description,
    this.image,
    @required this.watering,
    @required this.takingCare,
    @required this.howToPlant,
    //this.insects,
    //this.diseases,
    //this.articles,
  });
}

List<Plant> demoPlants = [
  Plant(id: 1,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),Plant(id: 1,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 2,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),Plant(id: 1,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 3,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),Plant(id: 1,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
  Plant(id: 4,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),Plant(id: 1,name: 'Apple',family: 'fruits', description: 'An apple a day keeps the doctor away! A tree which grows apples, have you ever tasted apples who has not? Im just typing now cause I think this should be a big section boggle boggle', watering: 'once a day',takingCare: ['Do not cut it off','water the tree','get a life'],howToPlant: ['put the seeds','put dirt','put water','wait for it!']),
];