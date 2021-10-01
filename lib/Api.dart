import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future sendData(url) async {
  print('In');
  var url1 = Uri.parse(url);
  final response = await http.post(url1, body: json.encode({}));
  print(response);
}

Future getData(url) async {
  http.Response response = await http.get(url);
  return response;
}
