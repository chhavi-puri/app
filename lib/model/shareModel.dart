import 'dart:typed_data';
import 'package:dbdummy/services/share.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';

class Shares{
final api= ShareAPI();
   onPressedShare(imagEURL) async
  {
      var responseFinal= api.onPressed(imagEURL);
      Uint8List bytes = await consolidateHttpClientResponseBytes(responseFinal);
                    print(bytes);
                    await Share.file('Check out this pet', 'I like it', bytes, 'image/png');
                    

  }

}
  