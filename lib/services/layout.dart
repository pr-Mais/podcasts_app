import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LayoutService {
  PageController _globalPageController;
  PageController get globalPageController => _globalPageController;

  // Main Panel
  PanelController _globalPanelController;
  PanelController get globalPanelController => _globalPanelController;

  LayoutService() {
    _initGlobalPanel();
    _initGlobalPage();
  }

  void _initGlobalPanel() {
    _globalPanelController = PanelController();
  }

  void _initGlobalPage() {
    _globalPageController = PageController(initialPage: 0);
  }
}
