import 'package:flutter/material.dart';
import 'package:issaq_pro/model/dzikir_sholat.dart';
import 'package:issaq_pro/theme.dart';

class DzikirSholat extends StatelessWidget {
  const DzikirSholat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: orangeColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: Expanded(
                        child: Text(
                      'Dzikir Sholat',
                      style: purplePoppins.copyWith(fontSize: 18),
                    )),
                  )
                ],
              ),
              Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: dzikirSetelahSholatList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(edge),
                          padding: EdgeInsets.all(edge),
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  dzikirSetelahSholatList[index].title,
                                  style: orangePoppins.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dzikirSetelahSholatList[index].arabic,
                                  style: orangePoppins.copyWith(fontSize: 20),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dzikirSetelahSholatList[index].translate,
                                  style: orangePoppins.copyWith(fontSize: 14),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
