import 'package:dbdummy/components/appbar.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:func('About Us'),
      body: Container(
        child: Center(
            child: Text(
          'Pawsome!',
          style: TextStyle(fontSize: 50),
        )),
      ),
    );
  }
}
