import 'package:flutter/material.dart';
import 'package:podcast_app/components/bottom-panel.dart';
import 'package:podcast_app/services/layout.dart';
import 'package:podcast_app/services/locator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../data.dart';

class TopPodcasts extends StatefulWidget {
  TopPodcasts({Key key}) : super(key: key);

  @override
  _TopPodcastsState createState() => _TopPodcastsState();
}

class _TopPodcastsState extends State<TopPodcasts> {
  final layoutService = locator<LayoutService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 180),
        child: Text('Top Podcasts'),
      ),
    );
  }
}
