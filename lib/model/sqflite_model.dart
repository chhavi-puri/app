import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

Database database;

class Pet {
  String uid;
  String petName;
  String petAge;
  String petBreed;
  String petDescription;

  Pet(
      {@required this.petName,
      @required this.uid,
      @required this.petAge,
      @required this.petBreed,
      @required this.petDescription});

//getters
  String get getUID {
    return uid;
  }

  String get getName {
    return petName;
  }

  String get getAge {
    return petAge;
  }

  String get getBreed {
    return petBreed;
  }

  String get getDescription {
    return petDescription;
  }

//setters
  set getUID(String uid) {
    this.uid = uid;
  }

  set getName(String name) {
    this.petName = name;
  }

  set getAge(String age) {
    this.petAge = age;
  }

  set getBreed(String breed) {
    this.petBreed = breed;
  }

  set getDescription(String description) {
    this.petDescription = description;
  }

  Map<String, dynamic> toMap() {
    return {
      'petName': petName,
      'uid': uid,
      'petAge': petAge,
      'petBreed': petBreed,
      'petDescription': petDescription
    };
  }

  Pet.fromMapObject(Map<String, dynamic> map) {
    this.uid = map['uid'];
    this.petName = map['petName'];
    this.petAge = map['petAge'];
    this.petBreed = map['petBreed'];
    this.petDescription = map['petDescription'];
  }
}
