import 'package:flutter/material.dart';
import 'package:movie/modules/home_pages/widgets/now_playing_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            NowPlayingWidget()
          ],
        ),
      ),
    ));
  }
}
