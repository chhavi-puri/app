import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(background,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
          color: Color.fromRGBO(255, 255, 255, 0.7),
          colorBlendMode: BlendMode.modulate),
    );
  }
}
