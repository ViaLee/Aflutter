import 'package:flutter/material.dart';
import 'package:my_flutter/page/home.dart';
import 'package:my_flutter/page/login.dart';
import 'package:my_flutter/page/publish.dart';

final routes = {
  '/index': (context) => const Home(),
  '/login': (context) => const LoginPage(),
  '/publish': (context) => const PublishPage()
};

var routers = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name as String;
  final Function pageContentBuilder = routes[name] as Function;
  final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
  return route;
};
