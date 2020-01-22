import 'package:flutter/material.dart';
import 'package:podcast_app/services/layout.dart';
import 'package:podcast_app/services/locator.dart';

import '../custom_icons_icons.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final layoutService = locator<LayoutService>();
  var currentIndex = 0;
  updatePage(index) {
    layoutService.globalPageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color(0xffBEBEBE),
      backgroundColor: Colors.white,
      elevation: 3.0,
      onTap: updatePage,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Icon(CustomIcons.list_ul_solid),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Library',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Icon(CustomIcons.microphone_solid),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'New',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Icon(CustomIcons.user_alt_solid),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ],
    );
  }
}
