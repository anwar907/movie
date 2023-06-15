import 'package:flutter/material.dart';
import 'package:movie/models/popular_models.dart';
import 'package:movie/provider/movie_provider.dart';
import 'package:movie/utils/const.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  late Future<PopularModels> popularMovie;

  @override
  void initState() {
    popularMovie = MovieProvider().popularMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularModels>(
        future: popularMovie,
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
                            ),
                          ),
                          Expanded(
                              flex: 0,
                              child: Text.rich(
                                softWrap: true,
                                TextSpan(
                                  text: dataMovies[index].title,
                                  onEnter: (event) {},
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ))
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
