import 'package:flutter/material.dart';

class AccountScreenModel {
  String _name;

  String _phone;

  TextEditingController _editName = TextEditingController();

  TextEditingController _editPhone = TextEditingController();

  bool _icon = false;

  bool _validateName = false;

  bool _validatePhone = false;

  bool _enabletextfield = false;

//getters and setters
  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  String get phone => _phone;

  set phone(String phone) {
    this._phone = phone;
  }

  bool get icon => _icon;

  set icon(bool icon) {
    this._icon = icon;
  }

  bool get validateName => _validateName;

  set validateName(bool validateName) {
    this._validateName = validateName;
  }

  bool get validatePhone => _validatePhone;

  set validatePhone(bool validatePhone) {
    this._validatePhone = validatePhone;
  }

  bool get enabletextfield => _enabletextfield;

  set enabletextfield(bool enabletextfield) {
    this._enabletextfield = enabletextfield;
  }

  TextEditingController get editName => _editName;

  set editName(TextEditingController editName) {
    this._editName = editName;
  }

  TextEditingController get editPhone => _editPhone;

  set editPhone(TextEditingController editPhone) {
    this._editPhone = editPhone;
  }
}
