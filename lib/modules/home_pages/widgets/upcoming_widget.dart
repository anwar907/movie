import 'package:flutter/material.dart';
import 'package:movie/models/upcoming_models.dart';
import 'package:movie/provider/movie_provider.dart';
import 'package:movie/utils/const.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  late Future<UpcomingModels> upcomingMovie;

  @override
  void initState() {
    upcomingMovie = MovieProvider().upcomingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingModels>(
        future: upcomingMovie,
        builder: (context, snapshot) {
          var movie = snapshot.data?.results ?? [];
          if (snapshot.hasData) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: movie.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.height / 5,
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(Const.imageMovie +
                                  movie[index].backdropPath!))),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
