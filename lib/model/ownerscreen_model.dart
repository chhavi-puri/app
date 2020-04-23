import 'dart:io';

import 'package:flutter/cupertino.dart';
TextEditingController petImage = TextEditingController();
TextEditingController petName = TextEditingController();
TextEditingController petAge = TextEditingController();
TextEditingController petBreed = TextEditingController();
TextEditingController petDescription = TextEditingController();
TextEditingController petGender = TextEditingController();
File image, imageFile;



class OwnerScreenModel {
  bool _validateImage = false;

  bool _validateName = false;

  bool _validateAge = false;

  bool _validateBreed = false;

  bool _validateDescription = false;

  bool _validateGender=false;
 String _imageUrl;
String _petAge;
String _petBreed;
String _petGender;
String _petDescription;
String _petName;
File _imageFile;
String get imageUrl => _imageUrl;

  set imageUrl(String imageUrl) {
    this._imageUrl = imageUrl;
  }

set imageFile( File imageFile )
{
  this._imageFile=imageFile;
}
File get imageFile=>_imageFile;

  //getters and setters

String get petAge => _petAge;

  set petAge(String petAge) {
    this._petAge = petAge;
  }
 
 String get petBreed => _petBreed;

  set petBreed(String petBreed) {
    this._petBreed = petBreed;
  }

  
 String get petGender => _petGender;

  set petGender(String petGender) {
    this._petGender = petGender;
  }

 String get petDescription => _petDescription;

  set petDescription(String petDescription) {
    this._petDescription = petDescription;
  }


  String get petName => _petName;

  set petName(String petName) {
    this._petName = petName;
  }


 bool get validateGender => _validateGender;

  set validateGender(bool validateGender) {
    this._validateGender = validateGender;
  }


  bool get validateImage => _validateImage;

  set validateImage(bool validateImage) {
    this._validateImage = validateImage;
  }

  bool get validateName => _validateName;

  set validateName(bool validateName) {
    this._validateName = validateName;
  }

  bool get validateAge => _validateAge;

  set validateAge(bool validateAge) {
    this._validateAge = validateAge;
  }

  bool get validateBreed => _validateBreed;

  set validateBreed(bool validateBreed) {
    this._validateBreed = validateBreed;
  }

  bool get validateDescription => _validateDescription;

  set validateDescription(bool validateDescription) {
    this._validateDescription = validateDescription;
  }
}
