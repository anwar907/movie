import 'package:flutter/material.dart';

import 'widgets/now_playing_widget.dart';
import 'widgets/popular_widget.dart';
import 'widgets/top_rated_widget.dart';
import 'widgets/upcoming_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leadingWidth: 100,
          backgroundColor: Colors.amber,
          title: Text(
            'Movies & TV Shows',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingWidget(),
                Text(
                  'Popular Movie',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const PopularWidget(),
                Text(
                  'Top Rated Movie',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const TopRatedWidget(),
                Text(
                  'Upcoming Movie',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const UpcomingWidget(),
              ],
            ),
          ),
        ));
  }
}
