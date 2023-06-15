import 'package:flutter/material.dart';
import 'package:movie/models/top_rated_models.dart';
import 'package:movie/provider/movie_provider.dart';

class TopRatedWidget extends StatefulWidget {
  const TopRatedWidget({super.key});

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  late Future<TopRatedModels> topMovie;

  @override
  void initState() {
    topMovie = MovieProvider().topRatedMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedModels>(
        future: topMovie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('data');
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
