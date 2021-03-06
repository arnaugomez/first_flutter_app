import 'package:first_flutter_app/src/pages/alert_page.dart';
import 'package:first_flutter_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          const Locale('en', 'US'), // American English
          const Locale('es', 'ES'), // Castilian Spanish
        ],
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        //home: HomePage());
        routes: getAppRoutes(),
        initialRoute: "home",
        onGenerateRoute: (RouteSettings settings) =>
            MaterialPageRoute(builder: (context) => AlertPage()));
  }
}
