import 'package:issaq_pro/model/doa.dart';
import 'package:issaq_pro/utils/custom_color.dart';
import 'package:flutter/material.dart';

class DetailScreenDoa extends StatelessWidget {
  const DetailScreenDoa({Key? key, required this.doa}) : super(key: key);

  final ModelDoa doa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: Text(
          doa.titleCover,
          style: purplePoppins.copyWith(fontSize: 16), 
        ),
        iconTheme: IconThemeData(color: grcolor, size: 35),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18),
              margin: EdgeInsets.symmetric(horizontal: edge, vertical: edge),
              decoration: BoxDecoration(
                  color: purpledof, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    doa.title,
                    style: orangePoppins.copyWith(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    doa.arabic,
                    style: orangePoppins.copyWith(fontSize: 20),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    doa.latin,
                    style: orangePoppins.copyWith(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    doa.translate,
                    style: orangePoppins.copyWith(fontSize: 14),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
