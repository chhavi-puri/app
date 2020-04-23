// bool secure1 = true;
// bool secure2 = true;
// String signuppassword, signupname, signupemail, signupphone;
// bool autovalidatename = false;
// // bool autovalidateemail = false;
// // bool autovalidatepassword = false;
// // bool autoconfirmpassword = false;
// bool autovalidatenumber = false;

// bool signuppress = false;
//Map<String, String> data;

class SignUpModel {
  String _signuppassword;

  String _signupname;

  String _signupemail;

  String _signupphone;

  bool _visible1 = true;

  bool _visible2 = true;

  bool _autovalidatename = false;

  bool _autovalidateemail = false;

  bool _autovalidatepassword = false;

  bool _autoconfirmpassword = false;

  bool _autovalidatenumber = false;

  //getters and setters

  String get signuppassword => _signuppassword;

  set signuppassword(String signuppassword) {
    this._signuppassword = signuppassword;
  }

  String get signupname => _signupname;

  set signupname(String signupname) {
    this._signupname = signupname;
  }

  String get signupemail => _signupemail;

  set signupemail(String signupemail) {
    this._signupemail = signupemail;
  }

  String get signupphone => _signupphone;

  set signupphone(String signupphone) {
    this._signupphone = signupphone;
  }

  bool get visible1 => _visible1;

  set visible1(bool visible1) {
    this._visible1 = visible1;
  }

  bool get visible2 => _visible2;

  set visible2(bool visible2) {
    this._visible2 = visible2;
  }

  bool get autovalidatename => _autovalidatename;

  set autovalidatename(bool autovalidatename) {
    this._autovalidatename = autovalidatename;
  }

  bool get autovalidatepassword => _autovalidatepassword;

  set autovalidatepassword(bool autovalidatepassword) {
    this._autovalidatepassword = autovalidatepassword;
  }

  bool get autoconfirmpassword => _autoconfirmpassword;

  set autoconfirmpassword(bool autoconfirmpassword) {
    this._autoconfirmpassword = autoconfirmpassword;
  }

  bool get autovalidatenumber => _autovalidatenumber;

  set autovalidatenumber(bool autovalidatenumber) {
    this._autovalidatenumber = autovalidatenumber;
  }

  bool get autovalidateemail => _autovalidateemail;

  set autovalidateemail(bool autovalidateemail) {
    this._autovalidateemail = autovalidateemail;
  }
}
