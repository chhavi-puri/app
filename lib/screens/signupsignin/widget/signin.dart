import 'package:dbdummy/model/sigin_model.dart';
import 'package:dbdummy/screens/signupsignin/widget/background.dart';
import 'package:dbdummy/screens/signupsignin/widget/dialogbox.dart';
import 'package:dbdummy/services/siginwithgoogle.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:dbdummy/viewModel/signin.dart';
import 'package:dbdummy/viewModel/validators.dart';
import 'package:flutter/material.dart';

final ksiginformKey = GlobalKey<FormState>();

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  SignInModel signInModel = SignInModel();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: ksiginformKey,
      child: Stack(children: <Widget>[
        Background(),
        Container(
          child: Container(
            child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    autovalidate: signInModel.autovalidateemail,
                    onEditingComplete: () {
                      setState(() {
                        signInModel.autovalidateemail = true;
                      });
                    },
                    validator: emailValidation,
                    onChanged: (value) {
                      setState(() {
                        signInModel.signinemail = value;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: outlineTextFiled,
                      prefixIcon: Icon(
                        Icons.mail,
                        size: 20.0,
                        color: firstcolor,
                      ),
                      hintText: 'Enter email id',
                    ),
                    // controller: email,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    autocorrect: false,
                    autovalidate: signInModel.autovalidatepassword,
                    onEditingComplete: () {
                      setState(() {
                        signInModel.autovalidatepassword = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        signInModel.signinpassword = value;
                      });
                    },
                    obscureText: signInModel.passwordVisible,
                    decoration: InputDecoration(
                        enabledBorder: outlineTextFiled,
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter password',
                        suffixIcon: IconButton(
                            icon: Icon(
                              signInModel.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: firstcolor,
                            ),
                            onPressed: () {
                              setState(() {
                                signInModel.passwordVisible =
                                    !signInModel.passwordVisible;
                              });
                            })), //controller: password,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return LoginAlert();
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 50),
                        padding: EdgeInsets.all(5),
                        child: Text('Forgot password?',
                            style: TextStyle(
                                color: firstcolor,
                                fontStyle: FontStyle.italic)),
                        //color: Colors.grey[300],
                        alignment: Alignment.bottomRight,
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 70,
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 20),
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      color: firstcolor,
                      shape: buttonborder,
                      onPressed: () async {
                        // setState(() {
                        //   signInModel.isLoading = true;
                        // });
                        onPressedLogin(context, signInModel);
                      },
                      child: Text('SignIn'),
                    ),
                  ),
                  Container(
                      child: Center(
                    child: Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 30),
                    child: OutlineButton(
                      splashColor: Colors.grey,
                      onPressed: () {
                        signInWithGoogle(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage(googleLogo), height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ]),
    );
  }
}
