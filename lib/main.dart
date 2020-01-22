import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:podcast_app/components/panel.dart';

import 'package:podcast_app/root.dart';
import 'package:podcast_app/services/layout.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/bottom-nav.dart';
import 'components/bottom-panel.dart';
import 'custom_icons_icons.dart';
import 'data.dart';
import 'services/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Podcast',
        theme: ThemeData(
          primaryColor: Color(0xff004EFF),
          brightness: Brightness.light,
          fontFamily: 'SFProText',
          textTheme: TextTheme(
              title: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Color(0xff373539)),
              subtitle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xff373539),
              ),
              caption: TextStyle(
                  color: Color(0xff7B7A7C),
                  fontWeight: FontWeight.w300,
                  fontSize: 16)),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color:Color(0xff004EFF) ),
            color: Colors.transparent,
            elevation: 0.0,
            brightness: Brightness.light,
          ),
          dividerColor: Color(0xffE0E3E5),
          canvasColor: Colors.grey.shade50,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          tabBarTheme: TabBarTheme(
            labelColor: Color(0xff004EFF),
            unselectedLabelColor: Color(0xff7B7A7C),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Color(0xff004EFF),
                width: 3.0,
              ),
              insets: EdgeInsets.only(right: 100),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(
          child: Root(),
        ));
  }
}

class Wrapper extends StatelessWidget {
  final Widget child;
  Wrapper({Key key, this.child}) : super(key: key);

  final layoutService = locator<LayoutService>();

  var radius = 0.0;
  var selectedPodcast;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SlidingUpPanel(
        controller: layoutService.globalPanelController,
        boxShadow: [],
        minHeight: 80,
        parallaxEnabled: true,
        backdropColor: Theme.of(context).primaryColor,
        backdropEnabled: true,
        backdropOpacity: 1.0,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        panel: FullPanel(),
        isDraggable: true,
        collapsed: BottomPanel(),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          theme: Theme.of(context),
        ),
      ),
    );
  }
}
