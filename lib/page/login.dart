import 'dart:convert';
import 'dart:ffi';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter/api/login.dart';
import 'package:my_flutter/page/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _type = 'register';

  Future signIn() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    debugPrint(_type);

    if (_type == 'login') {
      Api.login({'username': username, 'password': password}).then((res) {
        debugPrint('登录');
      });
    } else {
      Api.register({'username': username, 'password': password}).then((res) {
        debugPrint('注册');
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.popAndPushNamed(context, '/login');
        });
        // TODO: 怎么打印对象
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Icon(Icons.app_shortcut_outlined, size: 100),
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              Text(
                'TANGYA',
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              const SizedBox(height: 3),
              const Text(
                '躺着也能认识爱秀的电竞队友',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          // FIXME:contentPadding: padding
                          hintText: '用户名'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: '密码'),
                      obscureText: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: _type == 'login'
                      ? () {
                          debugPrint(_type);
                          //FIXME: runApp(const Home());
                          Navigator.pushNamed(context, '/index');
                        }
                      : signIn,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      _type == 'login' ? '登录' : '注册',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //FIXME: const []
                children: [
                  Text(
                    _type == 'login' ? '新用户？' : '已有账号？',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _type = 'login';
                      });
                    },
                    child: Text(
                      _type == 'login' ? '注册' : '登录',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
