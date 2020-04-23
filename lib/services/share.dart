import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
class ShareAPI
{
  onPressed(imagEURL) async{
     var request = await HttpClient().getUrl(Uri.parse(imagEURL));
     var response=  await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
        await Share.file('Check out this pet', 'I like it', bytes, 'image/png');
  }
}