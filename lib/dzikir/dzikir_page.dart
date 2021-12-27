import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:issaq_pro/dzikir/dzikir_pagi.dart';
import 'package:issaq_pro/dzikir/dzikir_sholat.dart';
import 'package:issaq_pro/utils/theme.dart';

import 'dzikir_malam.dart';

class DzikirPagiPetang extends StatelessWidget {
  const DzikirPagiPetang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: greenColor,
            )),
      ),
      backgroundColor: orangeColor,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DzikirPagi()));
              },
              child: ItemDzikir(title: 'Dzikir Pagi', image: 'assets/pagi.png'),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DzikirMalam()));
                },
                child: ItemDzikir(
                    title: 'Dzikir Malam', image: 'assets/petang.png')),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DzikirSholat()));
                },
                child: ItemDzikir(
                    title: 'Dzikir Sholat', image: 'assets/pray.png')),
          ],
        ),
      ),
    );
  }
}

class ItemDzikir extends StatelessWidget {
  const ItemDzikir({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: greenColor),
      margin: EdgeInsets.only(
        right: edge,
        left: edge,
        bottom: 3,
        top: edge,
      ),
      padding: EdgeInsets.all(10),
      height: 150,
      child: Stack(
        children: [
          Container(
            width: 200,
            margin: EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: orangePoppins.copyWith(fontSize: 32),
              maxLines: 2,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Flexible(
              child: Image.asset(
                image,
                width: 150,
              ),
            ),
          )
        ],
      ),
    );
  }
}
