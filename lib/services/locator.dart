import 'package:get_it/get_it.dart';

import 'layout.dart';


GetIt locator = GetIt.asNewInstance();

void setupLocator() {

  locator.registerSingleton(LayoutService());
}