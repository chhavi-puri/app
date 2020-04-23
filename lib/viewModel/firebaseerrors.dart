import 'package:dbdummy/screens/signupsignin/widget/alert.dart';
import 'package:dbdummy/utils/string_services.dart';
import 'package:flutter/material.dart';

String errorMessage;
catchFirebaseErrors(BuildContext context, error) {
  switch (error.code) {
    case "ERROR_INVALID_EMAIL":
      errorMessage = invalidEmail;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_WRONG_PASSWORD":
      errorMessage = invalidPassword;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_USER_NOT_FOUND":
      errorMessage = userNotFound;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_USER_DISABLED":
      errorMessage = userDisabled;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_TOO_MANY_REQUESTS":
      errorMessage = tooManyRequests;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_USER_TOKEN_EXPIRED":
      errorMessage = invalidCredentials;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_EMAIL_ALREADY_IN_USE ":
      errorMessage = emailInUse;
      showAlertDialog(context, errorMessage);
      break;
    case "ERROR_NETWORK_REQUEST_FAILED":
      errorMessage = networkError;
      showAlertDialog(context, errorMessage);
      break;
    default:
      errorMessage = defaultError;
      showAlertDialog(context, errorMessage);
  }
}
