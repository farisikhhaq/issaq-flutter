import 'package:flutter/material.dart';
import 'package:issaq_pro/model/dzikir_malam.dart';
import '../utils/theme.dart';

class DzikirMalam extends StatelessWidget {
  const DzikirMalam({Key? key}) : super(key: key);

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
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: Text(
                      'Dzikir Malam',
                      style: purplePoppins.copyWith(fontSize: 18),
                    ),
                  ))
                ],
              ),
              Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: dataDzikirPetang.length,
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
                                  dataDzikirPetang[index].title2,
                                  style: orangePoppins.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dataDzikirPetang[index].arab2,
                                  style: orangePoppins.copyWith(fontSize: 20),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dataDzikirPetang[index].arti2,
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
