import 'package:first_flutter_app/src/pages/alert_page.dart';
import 'package:first_flutter_app/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        //home: HomePage());
        routes: getAppRoutes(),
        initialRoute: "home",
        onGenerateRoute: (RouteSettings settings) =>
            MaterialPageRoute(builder: (context) => AlertPage()));
  }
}
