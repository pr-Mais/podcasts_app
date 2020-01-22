import 'package:flutter/material.dart';
import 'package:podcast_app/pages/top-podcasts.dart';
import 'package:podcast_app/services/layout.dart';
import 'package:podcast_app/services/locator.dart';

import 'custom_icons_icons.dart';
import 'data.dart';

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  var currentIndex = 0;
  final layoutService = locator<LayoutService>();

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
      length: 3,
      vsync: this,
    );
    pageController = new PageController();
  }

  Widget playlistItem(index) {
    return GestureDetector(
      onTap: () {
        //openPodcast(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(
                CustomIcons.play,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      playListItems[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      playListItems[index]['author'],
                      style: Theme.of(context).textTheme.caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  playListItems[index]['duration'],
                  style: Theme.of(context).textTheme.caption,
                )),
          ],
        ),
      ),
    );
  }

  Widget subtitle(text) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.subtitle,
              ),
              GestureDetector(
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TopPodcasts()));
                },
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: SizedBox.fromSize(
            size: Size.fromHeight(1.0),
            child: Divider(),
          ),
        ),
      ],
    );
  }

  updateTab(index) {
    tabController.animateTo(index);
  }

  updatePage(index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: layoutService.globalPageController,
      children: <Widget>[
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Library',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TabBar(
                  controller: tabController,
                  onTap: updatePage,
                  labelPadding: EdgeInsets.zero,
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Listen now',
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Discover',
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Favorite',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(1.0),
                child: Divider(),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: updateTab,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        subtitle('Top podcasts in books'),
                        Container(
                          height: 200,
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            itemCount: podcasts.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200,
                                height: 200,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: Image.asset(
                                  podcasts[index],
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        subtitle('Playlists'),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            itemCount: playListItems.length,
                            itemBuilder: (context, index) {
                              return playlistItem(index);
                            },
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Text('Discover'),
                    ),
                    Center(
                      child: Text('Favorite'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 180,
              ),
            ],
          ),
        ),
        Material(
          child: Center(
            child: Text('New'),
          ),
        ),
        Material(
          child: Center(
            child: Text('Profile'),
          ),
        ),
      ],
    );
  }
}
