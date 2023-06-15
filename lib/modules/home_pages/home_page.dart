import 'package:flutter/material.dart';
import 'package:movie/modules/home_pages/widgets/now_playing_widget.dart';
import 'package:movie/modules/home_pages/widgets/popular_widget.dart';
import 'package:movie/modules/home_pages/widgets/top_rated_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            const NowPlayingWidget(),
            Text(
              'Popular Movie',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const PopularWidget(),
            Text(
              'Top Rated Movie',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const TopRatedWidget(),
          ],
        ),
      ),
    ));
  }
}
