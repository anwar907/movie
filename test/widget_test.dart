import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:movie/utils/const.dart';

void main() {
  group('Response API', () {
    test('response from now playing', () async {
      var response = await http.get(Uri.parse(Const.baseUrl + Const.nowPlaying),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      var result = jsonDecode(response.body);

      print(result);
    });

    test('response from popular', () async {
      var response = await http.get(Uri.parse(Const.baseUrl + Const.popular),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      var result = jsonDecode(response.body);

      print(result);
    });

    test('response from top rated', () async {
      var response = await http.get(Uri.parse(Const.baseUrl + Const.topRated),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      var result = jsonDecode(response.body);

      print(result);
    });

    test('response from upcoming', () async {
      var response = await http.get(Uri.parse(Const.baseUrl + Const.upcoming),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      var result = jsonDecode(response.body);

      print(result);
    });
  });
}
