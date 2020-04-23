import 'package:connectivity/connectivity.dart';

checkConnectivity()async{
   var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult;
  }