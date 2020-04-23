import 'package:flutter/material.dart';

TextEditingController userImage = TextEditingController();
TextEditingController userWork = TextEditingController();
TextEditingController userAge = TextEditingController();
TextEditingController userWorkingHours = TextEditingController();
TextEditingController userOtherPets = TextEditingController();
TextEditingController userPetDetails = TextEditingController();
class BuyerForm{
  String _wfh;
  String _wfhResult;
   String _numberofPets;
  String _numberofPetsRes;
  String _occupation;
  String _familyMembers;
String _userAge;
String _workingHours;
bool _validateOtherPets = false;
bool _validatePetDetails=false;
bool _enableField=false;
bool _checkBox1=false;
bool _checkBox2=false;

//getters n setters

set familyMembers(String familyMembers) {
    this._familyMembers = familyMembers;
  }
  String get familyMembers => _familyMembers;



set enableField(bool enableField) {
    this._enableField = enableField;
  }
  bool get enableField => _enableField;


set validatePetDetails(bool validatePetDetails) {
    this._validatePetDetails = validatePetDetails;
  }
  bool get validatePetDetails => _validatePetDetails;

set wfh(String wfh) {
    this._wfh = wfh;
  }
  String get wfh => _wfh;


  set numberofPets(String numberofPets) {
    this._numberofPets = numberofPets;
  }
  String get numberofPets => _numberofPets;


set wfhResult(String wfhResult) {
    this._wfhResult = wfhResult;
  }
  String get wfhResult => _wfhResult;

  set occupation(String occupation) {
    this._occupation = occupation;
  }
  String get occupation => _occupation;


set numberofPetsRes(String numberofPetsRes) {
    this._numberofPetsRes = numberofPetsRes;
  }
  String get numberofPetsRes => _numberofPetsRes;






  set userAge(String userAge) {
    this._userAge = userAge;
  }
  String get userAge => _userAge;

  set workingHours(String workingHours) {
    this._workingHours = workingHours;
  }
  String get workingHours => _workingHours;

  
  set validateOtherPets(bool validateOtherPets) {
    this._validateOtherPets = validateOtherPets;
  }
  bool get validateOtherPets => _validateOtherPets;

set checkBox1(bool checkBox1) {
    this._checkBox1 = checkBox1;
  }
  bool get checkBox1=> _checkBox1;

  set checkBox2(bool checkBox2) {
    this._checkBox2 = checkBox2;
  }
  bool get checkBox2 => _checkBox2;

}