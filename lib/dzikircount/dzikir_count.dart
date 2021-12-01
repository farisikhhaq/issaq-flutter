import 'package:flutter/material.dart';
import 'package:issaq_pro/dzikircount/buttons.dart';
import 'package:issaq_pro/dzikircount/viewDzikir.dart';

import 'listText.dart';


class dzikircount extends StatefulWidget {
  int awal = 0;
  int dzikirKe = 0;
  int gantiDzikir = 0;
  int batasan = 33;
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<dzikircount> {
  List<String> text_list = [
    "Subhanalloh",
    "Alhamdulillah",
    "Allohu akbar",
    "La ilaha illallohu vahdahu la sharika lah, lahul mulku va lahul hamd. Va huva 'ala kulli shayin qodir."
  ];

  void tambahButir() {
    setState(() {
      if (widget.awal >= 33) {
        widget.awal = 1;
      } else {
        widget.awal++;
      }
      if (widget.gantiDzikir <= 32 && widget.gantiDzikir >= 0) {
        if (widget.gantiDzikir == 0 && widget.dzikirKe == 3) {
          widget.awal = 1;
        }
        widget.batasan = 33;
        widget.dzikirKe = 0;
      } else if (widget.gantiDzikir <= 65 && widget.gantiDzikir >= 33) {
        widget.dzikirKe = 1;
      } else if (widget.gantiDzikir <= 98 && widget.gantiDzikir >= 66) {
        widget.dzikirKe = 2;
      } else {
        widget.awal = 1;
        widget.dzikirKe = 3;
        widget.gantiDzikir = -1;
        widget.batasan = 1;
      }
      widget.gantiDzikir++;
      print("Dzikir Ke ${widget.gantiDzikir}");
      print("Jenis Dzikir Ke ${widget.dzikirKe}");
    });
  }

  void kurangiButir() {
    setState(() {
      if (widget.awal == -0) {
        widget.awal = 33;
      } else {
        widget.awal--;
      }
      if (widget.awal != 0) {
        widget.gantiDzikir--;
      }
      if (widget.gantiDzikir == 1 &&
          widget.dzikirKe == 0 &&
          widget.awal == 0) {
        widget.gantiDzikir = 0;
      }
      if (widget.gantiDzikir <= 33 && widget.gantiDzikir >= 0) {
        widget.batasan = 33;
        widget.dzikirKe = 0;
      } else if (widget.gantiDzikir <= 66 && widget.gantiDzikir >= 32) {
        widget.dzikirKe = 1;
      } else if (widget.gantiDzikir <= 100 && widget.gantiDzikir >= 67) {
        widget.dzikirKe = 2;
        widget.batasan = 33;
      } else {
        widget.awal = 0;
        widget.dzikirKe = 3;
        widget.batasan = 1;
        widget.gantiDzikir = 99;
      }
      print("Dzikir Ke $widget.gantiDzikir");
      print("Jenis Dzikir Ke $widget.dzikirKe");
    });
  }

  void restart() {
    setState(() {
      widget.awal = 0;
      widget.batasan = 0;
      widget.dzikirKe = 0;
      widget.gantiDzikir = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tasbih app"),
          actions: [
            IconButton(
              icon: Icon(Icons.restart_alt),
              onPressed: () {
                setState(() {
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListText(text_list, widget.dzikirKe),
                Present(awal: widget.awal, batasan: widget.batasan),
                Column(
                  children: [
                    Buttons(tambahButir, widget.gantiDzikir,
                        kurangiButir),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}