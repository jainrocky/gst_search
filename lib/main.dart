import 'package:flutter/material.dart';
import 'package:gst_search/models/gst_profile.dart';
import 'package:gst_search/services/gst_api.dart';
import 'package:gst_search/views/gst_result_view.dart';
import 'package:gst_search/views/gst_search_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GST Search',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: GSTSearchView(),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
      switch (settings.name) {
        case GSTSearchView.routeName:
          return PageRouteBuilder(pageBuilder: (_, __, ___) => GSTSearchView());
        case GSTResultView.routeName:
          GSTProfile profile=settings.arguments;
          return PageRouteBuilder(pageBuilder: (_, __, ___) => GSTResultView(profile));
      }
    }

}
