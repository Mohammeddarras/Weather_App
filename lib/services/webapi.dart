
import 'dart:convert';

import 'package:http/http.dart';

class WebAPIHelper{
  String url;

  WebAPIHelper({this.url});

  Future getData() async {
    var result = await get(url);
    return jsonDecode(result.body);
  }

}