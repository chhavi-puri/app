import 'package:dbdummy/database/firebasesignup_services.dart';
import 'package:dbdummy/screens/accountScreen.dart';

onPressedAccountScreen(accountScreenModel, context) {
  if (kaccountKey.currentState.validate()) {
    kaccountKey.currentState.save();
    try {
      updateData(accountScreenModel, context);
    } catch (e) {
      print(e.message);
    }
  }
}
