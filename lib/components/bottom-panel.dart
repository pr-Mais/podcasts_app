import 'package:flutter/material.dart';
import 'package:podcast_app/services/layout.dart';
import 'package:podcast_app/services/locator.dart';


import '../custom_icons_icons.dart';

class BottomPanel extends StatelessWidget {

  final layoutService = locator<LayoutService>();
  
  void showPanel(){
    layoutService.globalPanelController.open();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: showPanel,
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: <Widget>[
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nothing is playing',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container()
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(CustomIcons.play),
            )
          ],
        ),
      ),
    );
  }
}
