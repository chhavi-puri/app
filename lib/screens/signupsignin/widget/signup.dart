import 'package:dbdummy/model/signup_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/background.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:dbdummy/viewModel/signup.dart';
import 'package:dbdummy/viewModel/validators.dart';
import 'package:flutter/material.dart';

final ksigupformKey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

String uid;

class _SignupState extends State<Signup> {
  SignUpModel signUpModel = SignUpModel();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: ksigupformKey,
        child: Stack(children: <Widget>[
          Background(),
          ListView(children: <Widget>[
            SizedBox(
              height: 90,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autovalidate: signUpModel.autovalidateemail,
              onEditingComplete: () {
                setState(() {
                  signUpModel.autovalidateemail = true;
                });
              },
              decoration: InputDecoration(
                enabledBorder: outlineTextFiled,
                prefixIcon: Icon(
                  Icons.person,
                  size: 20.0,
                  color: firstcolor,
                ),
                labelText: 'Name',
                hintStyle: TextStyle(color: firstcolor),
              ),
              validator: nameValidation,
              onChanged: (value) {
                setState(() {
                  signUpModel.signupname = value;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autovalidate: signUpModel.autovalidateemail,
              onEditingComplete: () {
                setState(() {
                  signUpModel.autovalidateemail = true;
                });
              },
              decoration: InputDecoration(
                enabledBorder: outlineTextFiled,
                prefixIcon: Icon(
                  Icons.mail,
                  size: 20.0,
                  color: firstcolor,
                ),
                labelText: 'Email',
                hintStyle: TextStyle(color: firstcolor),
              ),
              validator: emailValidation,
              onChanged: (value) {
                setState(() {
                  signUpModel.signupemail = value;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              autovalidate: signUpModel.autovalidatenumber,
              keyboardType: TextInputType.phone,
              onEditingComplete: () {
                setState(() {
                  signUpModel.autovalidateemail = true;
                });
              },
              decoration: InputDecoration(
                enabledBorder: outlineTextFiled,
                prefixIcon: Icon(
                  Icons.phone,
                  size: 20.0,
                  color: firstcolor,
                ),
                labelText: 'Phone',
                hintStyle: TextStyle(color: firstcolor),
              ),
              validator: numberValidation,
              onChanged: (value) {
                setState(() {
                  signUpModel.signupphone = value;
                });
              },
            ),
         SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: signUpModel.visible1,
              autovalidate: signUpModel.autovalidatepassword,
              onEditingComplete: () {
                setState(() {
                  signUpModel.autovalidatepassword = true;
                });
              },
              decoration: InputDecoration(
                enabledBorder: outlineTextFiled,
                prefixIcon: Icon(
                  Icons.enhanced_encryption,
                  size: 20.0,
                  color: firstcolor,
                ),
                hintStyle: TextStyle(color: firstcolor),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    signUpModel.visible1
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: firstcolor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      signUpModel.visible1 = !signUpModel.visible1;
                    });
                  },
                ),
              ),
              validator: passwordValidation,
              onChanged: (value) {
                setState(() {
                  signUpModel.signuppassword = value;
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: signUpModel.visible2,
              autovalidate: signUpModel.autoconfirmpassword,
              onEditingComplete: () {
                setState(() {
                  signUpModel.autoconfirmpassword = true;
                });
              },
              decoration: InputDecoration(
                enabledBorder: outlineTextFiled,
                prefixIcon: Icon(
                  Icons.enhanced_encryption,
                  size: 20.0,
                  color: firstcolor,
                ),
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    signUpModel.visible2
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: firstcolor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      signUpModel.visible2 = !signUpModel.visible2;
                    });
                  },
                ),
              ),
              validator: confirmpassword,
              onChanged: (value) {
                setState(() {
                  signUpModel.signuppassword = value;
                });
              },
            ),
            SizedBox(
              height: 100,
            ),
            Container(
                padding: EdgeInsets.all(10),
                width: 320,
                height: 80,
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  color: firstcolor,
                  shape: buttonborder,
                  onPressed: () {
                    onPressedSignup(context, signUpModel);
                  },
                  child: Text('SignUp'),
                ))
          ])
        ]));
  }
}
