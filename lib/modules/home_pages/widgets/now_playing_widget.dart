import 'package:flutter/material.dart';
import 'package:movie/models/now_playing_models.dart';
import 'package:movie/provider/movie_provider.dart';
import 'package:movie/utils/const.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({super.key});

  @override
  State<NowPlayingWidget> createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  late Future<NowPlayingModels> nowPlaying;

  @override
  void initState() {
    nowPlaying = MovieProvider().nowPlayingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NowPlayingModels>(
        future: nowPlaying,
        builder: (context, snapshot) {
          var dataMovie = snapshot.data?.results ?? [];
          if (snapshot.hasData) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: MediaQuery.of(context).size.height / 4,
                              height: MediaQuery.of(context).size.height / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(Const.imageMovie +
                                          dataMovie[index].backdropPath!))),
                            ),
                          ),
                          Expanded(
                            child: Text(dataMovie[index].title ?? ''),
                          )
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
