import 'package:dbdummy/screens/signupsignin/widget/signin.dart';
import 'package:dbdummy/screens/signupsignin/widget/signup.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabLoginController extends StatefulWidget {
  @override
  _TabLoginControllerState createState() => _TabLoginControllerState();
}

class _TabLoginControllerState extends State<TabLoginController> {
  //Default tab controller for signin and signup

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: firstcolor,
            elevation: 90,
            bottom: TabBar(
              tabs: <Widget>[
                Text(
                  'SignIn',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'SignUp',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Signin(),
              Signup(),
            ],
           ),
        ));
  }
}
