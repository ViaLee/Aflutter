import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class PublishPage extends StatefulWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  PublishPageState createState() => PublishPageState();
}

class PublishPageState extends State<PublishPage> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text("发布"),
                onPressed: _loading ? null : () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(RegExp(r"\s"), "")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
