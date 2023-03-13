import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_flutter/config/router.dart';
import 'package:my_flutter/page/home.dart';
import './page/login.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      builder: EasyLoading.init(),
      onGenerateRoute: routers,
    );
  }
}
