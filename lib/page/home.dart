import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_flutter/config/router.dart';
import 'package:my_flutter/page/publish.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  static int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      builder: EasyLoading.init(),
      onGenerateRoute: routers,
      home: Scaffold(
        appBar: AppBar(title: const Text("躺鸭")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context,'/publish');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(
                    width: double.infinity, height: 150),
                child: Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.calendar_month),
                      Text('签到'),
                      Text(
                        '点击签到',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.star_rate),
                      Text('排行榜'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.card_giftcard),
                      Text('福利'),
                      Text(
                        '即将开放',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.star_rate),
                      Text('许愿池'),
                      Text(
                        '233个愿望',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // fixedColor: Colors.purple,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black45,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: '福利',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '日历',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.man),
              label: '我的',
            ),
          ],
        ),
      ),
    );
  }
}
