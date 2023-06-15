import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/now_playing_models.dart';
import 'package:movie/models/popular_models.dart';
import 'package:movie/models/top_rated_models.dart';
import 'package:movie/models/upcoming_models.dart';
import 'package:movie/utils/const.dart';

class MovieProvider {
  Future<NowPlayingModels> nowPlayingMovie() async {
    try {
      final response = await http
          .get(Uri.parse(Const.baseUrl + Const.nowPlaying), headers: {
        'accept': 'application/json',
        'Authorization': Const.token
      });

      final result = jsonDecode(response.body);

      return NowPlayingModels.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<PopularModels> popularMovie() async {
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + Const.popular),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });
      final result = jsonDecode(response.body);

      return PopularModels.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<TopRatedModels> topRatedMovie() async {
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + Const.topRated),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });
      final result = jsonDecode(response.body);

      return TopRatedModels.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UpcomingModels> upcomingMovie() async {
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + Const.upcoming),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      final result = jsonDecode(response.body);

      return UpcomingModels.fromJson(result);
    } catch (e) {
      return Future.error(e);
    }
  }
}
