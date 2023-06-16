import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/now_playing_models.dart';
import 'package:movie/models/popular_models.dart';
import 'package:movie/models/top_rated_models.dart';
import 'package:movie/models/upcoming_models.dart';
import 'package:movie/utils/const.dart';

class MovieProvider {
  /// Fetch data from Now Playing Movie
  Future<NowPlayingModels> nowPlayingMovie() async {
    try {
      final response = await http
          .get(Uri.parse(Const.baseUrl + Const.nowPlaying), headers: {
        'accept': 'application/json',
        'Authorization': Const.token
      });

      if (response.statusCode == 200) {
        return NowPlayingModels.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Fetch data from Popular Movie
  Future<PopularModels> popularMovie() async {
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + Const.popular),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      if (response.statusCode == 200) {
        return PopularModels.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Fetch data from Top Rating Movie
  Future<TopRatedModels> topRatedMovie() async {
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + Const.topRated),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });
      if (response.statusCode == 200) {
        return TopRatedModels.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Fetch data from Upcoming Movie
  Future<UpcomingModels> upcomingMovie() async {
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + Const.upcoming),
          headers: {
            'accept': 'application/json',
            'Authorization': Const.token
          });

      if (response.statusCode == 200) {
        return UpcomingModels.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
