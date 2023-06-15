import 'package:flutter/material.dart';
import 'package:movie/models/top_rated_models.dart';
import 'package:movie/provider/movie_provider.dart';
import 'package:movie/utils/const.dart';

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
          var dataMovies = snapshot.data?.results ?? [];
          if (snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                                width: MediaQuery.of(context).size.height / 5,
                                height: MediaQuery.of(context).size.height / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(Const.imageMovie +
                                            dataMovies[index].backdropPath!))),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text.rich(
                                    softWrap: true,
                                    TextSpan(
                                      text: dataMovies[index].title,
                                      onEnter: (event) {},
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(color: Colors.white),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
