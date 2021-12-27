import 'package:issaq_pro/dzikir/dzikir_page.dart';
import 'package:issaq_pro/jadwal/adzan_list.dart';
import 'package:issaq_pro/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:issaq_pro/page/doa_page.dart';

import 'murrotal-page.dart';
import 'dzikircounter-page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: orangeColor,
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: greenColor,
                      ))
                ],
              ),
              Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(80))),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: Text(
                              'Sholat &\nQuran\nApp',
                              style: whiteNormal.copyWith(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Flexible(
                                child: Image.asset(
                              'assets/img_title.png',
                              height: 200,
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(80))),
                      child: SingleChildScrollView(
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 127),
                                child: Text(
                                  'Menu Utama',
                                  style: blackNormal.copyWith(fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdzanList()));
                                },
                                child: ItemMenu(
                                  title: 'Jadwal Sholat',
                                  img: 'assets/img_1.png',
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoaPage()));
                                },
                                child: ItemMenu(
                                  title: 'Doa Harian',
                                  img: 'assets/img_2.png',
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DoaPage()));
                                },
                                child: ItemMenu(
                                  title: 'Wish List Hafalan',
                                  img: 'assets/img_3.png',
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DzikirPagiPetang()));
                                },
                                child: ItemMenu(
                                  title: 'Dzikir Pagi Malam',
                                  img: 'assets/img_4.png',
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DzikirCountPage()));
                                },
                                child: ItemMenu(
                                  title: 'Dzikir Counter',
                                  img: 'assets/img_5.png',
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MurrotalPage()));
                                },
                                child: ItemMenu(
                                  title: 'Murrotal Quran',
                                  img: 'assets/img_6.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.title,
    required this.img,
  }) : super(key: key);

  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greenColor, borderRadius: BorderRadius.circular(15)),
      height: 80,
      margin: EdgeInsets.only(left: edge, right: 24),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Flexible(
              child: Container(
            margin: EdgeInsets.only(left: 10),
            width: 220,
            child: Text(
              title,
              style: whiteNormal.copyWith(fontSize: 16),
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
          )),
          Image.asset(img)
        ],
      ),
    );
  }
}
