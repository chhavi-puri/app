import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/utils/style.dart';
import 'package:flutter/material.dart';
func(String titles)
{
  final appbar= AppBar(
    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        centerTitle: true,
        title: Text(
          titles,
          style: style
        ),
        flexibleSpace: Container(
          decoration: boxDecoration,
        ),
);
return appbar;
 
}
