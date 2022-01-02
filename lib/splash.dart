import 'package:flutter/material.dart';
import 'package:issaq_pro/main.dart';
import 'package:issaq_pro/utils/theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CurvedNavWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 60, 10, 50),
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Image.asset("assets/issaq.png"),
                  height: 390,
                  width: 390,
                ),
              ),
              Text(
                'Infomation Shola and Quran',
                style: TextStyle(
                  fontSize: 24,
                  color: greenColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
              Text(
                'By ISSAQ TEAM',
                style: TextStyle(
                  fontSize: 24,
                  color: darkToscaColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
