import 'package:first_flutter_app/src/pages/alert_page.dart';
import 'package:first_flutter_app/src/pages/animated_container.dart';
import 'package:first_flutter_app/src/pages/avatar_page.dart';
import 'package:first_flutter_app/src/pages/card_page.dart';
import 'package:first_flutter_app/src/pages/home_page.dart';
import 'package:first_flutter_app/src/pages/input_page.dart';
import 'package:first_flutter_app/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

WidgetBuilder getBuilder(Widget widget) => ((BuildContext context) => widget);

Map<String, WidgetBuilder> getAppRoutes() => {
      "home": getBuilder(HomePage()),
      "alert": getBuilder(AlertPage()),
      "avatar": getBuilder(AvatarPage()),
      "card": getBuilder(CardPage()),
      "animated_container": getBuilder(AnimatedContainerPage()),
      "inputs": getBuilder(InputPage()),
      "slider": getBuilder(SliderPage()),
    };
