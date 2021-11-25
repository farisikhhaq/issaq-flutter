import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:issaq_pro/page/artikel-page.dart';
import 'package:issaq_pro/page/quran-page.dart';
import 'package:issaq_pro/page/doa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:issaq_pro/page/class_two.dart';
import 'package:issaq_pro/page/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurvedNavWidget(),
    );
  }
}

class CurvedNavWidget extends StatefulWidget {
  @override
  CurvedNavWidgetState createState() => CurvedNavWidgetState();
}

class CurvedNavWidgetState extends State<CurvedNavWidget> {
  int pageIndex = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //Create All The Pages
  final ArtikelPage _classOne = ArtikelPage();
  final HomeScreen _classTwo = HomeScreen();
  final QuranPage _classThree = QuranPage();

  Widget _showPage = new HomeScreen();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _classOne;
      case 1:
        return _classTwo;
      case 2:
        return _classThree;
      default:
        return new Container(
          child: Center(
            child: new Text(
              'No Page Found!',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.copy_outlined, size: 30),
          Icon(Icons.home, size: 30),
          //Icon(Icons.call_split, size: 30),
          Icon(Icons.book, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        //backgroundColor: Colors.blueAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _showPage,
    );
  }
}
