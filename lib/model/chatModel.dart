import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatModel {
  TextEditingController _messageController = TextEditingController();

  ScrollController _scrollController = ScrollController();

  String _chatId;

  FirebaseUser _user;

  var _details;

  String _name;

//getters and setters
 
 
  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  get details => _details;

  set details(details) {
    this._details = details;
  }

  FirebaseUser get user => _user;

  set user(FirebaseUser user) {
    this._user = user;
  }

  ScrollController get scrollController => _scrollController;

  set scrollController(ScrollController scrollController) {
    this._scrollController = scrollController;
  }

  TextEditingController get messageController => _messageController;

  set messageController(TextEditingController messageController) {
    this._messageController = messageController;
  }

  String get chatId => _chatId;

  set chatId(String chatId) {
    this._chatId = chatId;
  }
}
