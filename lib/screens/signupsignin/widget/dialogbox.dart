import 'package:dbdummy/model/sigin_model.dart';
// import 'package:dbdummy/provider/validators.dart';
import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/viewModel/validators.dart';
import 'package:flutter/material.dart';

class LoginAlert extends StatefulWidget {
  @override
  _LoginAlertState createState() => _LoginAlertState();
}

class _LoginAlertState extends State<LoginAlert> {
  SignInModel signInModel = SignInModel();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Dialog(
        child: Form(
          key: signInModel.kalertformkey,
          child: Card(
            child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Change Password',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      obscureText: signInModel.passwordVisible,
                      autovalidate: signInModel.autovalidatepassword,
                      onEditingComplete: () {
                        setState(() {
                          signInModel.autovalidateemail = true;
                        });
                      },
                      validator: passwordValidation,
                      onChanged: (value) {
                        setState(() {
                          signInModel.signinnewPassword = value;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: firstcolor)),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20.0,
                          color: firstcolor,
                        ),
                        hintText: 'Enter New Password',
                      ),
                      // controller: newPassword,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: TextFormField(
                        obscureText: signInModel.passwordVisible,
                        autovalidate: signInModel.autovalidatepassword,
                        onEditingComplete: () {
                          setState(() {
                            signInModel.autovalidatepassword = true;
                          });
                        },
                        validator: confirmpassword,
                        onChanged: (value) {
                          setState(() {
                            signInModel.signinnewPasswordConfirm = value;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: firstcolor)),
                          prefixIcon: Icon(
                            Icons.mail,
                            size: 20.0,
                            color: firstcolor,
                          ),
                          hintText: 'Confirm New Password',
                        ),
                        // controller: newPasswordConfirm,
                      ),
                    ),
                  ),
                  Container(
                      width: 280,
                      child: RaisedButton(
                        color: firstcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                            side: BorderSide(color: Colors.white)),
                        onPressed: () {
                          if (signInModel.kalertformkey.currentState
                              .validate()) {
                            signInModel.kalertformkey.currentState.save();
                            //                         try {
                            //     FirebaseAuth.instance
                            //         .sendPasswordResetEmail('email':signinemail);
                            // } catch (e) {
                            //     print(e);
                          }

                          //  }
                        },
                        child: Text('Submit'),
                      )),
                ])),
          ),
        ),
      );
    });
  }
}

// AlertDialog alert = AlertDialog(
//     title: Text(
//       "Alert!",
//       style: TextStyle(color: Colors.red),
//     ),
//     content: Text("Incorrect user/password."),
//   );

// showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Form(
//             key: kalertformkey,
//             child: Card(
//               child: Container(
//                   width: 300,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     border: Border.all(color: Colors.black, width: 2),
//                   ),
//                   child: Column(children: <Widget>[
//                     Expanded(
//                       flex: 1,
//                       child: Text(
//                         'Change Password',
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: TextFormField(
//                         obscureText: newPasswordVisible,
//                         autovalidate: autovalidateemail,
//                         onEditingComplete: () {
//                           setState(() {
//                             autovalidateemail = true;
//                           });
//                         },
//                         validator: passwordValidation,
//                         onChanged: (value) {
//                           setState(() {
//                             signinpassword = value;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(40),
//                               borderSide: BorderSide(color: firstcolor)),
//                           prefixIcon: Icon(
//                             Icons.lock,
//                             size: 20.0,
//                             color: firstcolor,
//                           ),
//                           hintText: 'Enter New Password',
//                         ),
//                         // controller: newPassword,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(
//                         child: TextFormField(
//                           obscureText: newPasswordVisible,
//                           autovalidate: autovalidateemail,
//                           onEditingComplete: () {
//                             setState(() {
//                               autovalidateemail = true;
//                             });
//                           },
//                           validator: confirmpassword,
//                           onChanged: (value) {
//                             setState(() {
//                               signinemail = value;
//                             });
//                           },
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(40),
//                                 borderSide: BorderSide(color: firstcolor)),
//                             prefixIcon: Icon(
//                               Icons.mail,
//                               size: 20.0,
//                               color: firstcolor,
//                             ),
//                             hintText: 'Confirm New Password',
//                           ),
//                           // controller: newPasswordConfirm,
//                         ),
//                       ),
//                     ),
//                     Container(
//                         width: 280,
//                         child: RaisedButton(
//                           color: firstcolor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(40.0),
//                               side: BorderSide(color: Colors.white)),
//                           onPressed: () {
//                             if (kalertformkey.currentState.validate()) {
//                               kalertformkey.currentState.save();
//                               //                         try {
//                               //     FirebaseAuth.instance
//                               //         .sendPasswordResetEmail('email':signinemail);
//                               // } catch (e) {
//                               //     print(e);
//                             }

//                             //  }
//                           },
//                           child: Text('Submit'),
//                         )),
//                   ])),
//             ),
//           ),
//         );
//       })
