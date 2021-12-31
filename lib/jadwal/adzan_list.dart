import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:issaq_pro/model/adhan_waktu.dart';
import 'package:issaq_pro/utils/theme.dart';

class AdzanList extends StatefulWidget {
  const AdzanList({Key? key}) : super(key: key);

  @override
  State<AdzanList> createState() => _AdzanListState();
}

class _AdzanListState extends State<AdzanList> {
  late PrayerTimes prayerTimes;
  late DateTime date;
  late Coordinates coordinates;
  late CalculationParameters params;
  @override
  void initState() {
    coordinates = Coordinates(-7.983908, 112.621391);
    date = DateTime.now();
    params = CalculationMethod.Dubai();
    prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: orangeColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: greenColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(90, 10, 10, 0),
                    child: Text(
                      'Jadwal Sholat',
                      style: TextStyle(
                          fontFamily: 'Georgia',
                          color: greenColor,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(children: <Widget>[
                  InkWell(
                      child: ListTile(
                    title: Text(
                        "${date.day} ${adzanbulan[date.month - 1]} ${date.year}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        )),
                    subtitle: Text(
                      "Untuk Wilayah Malang",
                      textAlign: TextAlign.center,
                    ),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                      color: greenColor,
                      child: ListTile(
                        title: Text("Sholat Shubuh",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: backColor)),
                        subtitle: Text(
                            "0${prayerTimes.fajr!.toLocal().hour}:${prayerTimes.fajr!.toLocal().minute}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: backColor)),
                      )),
                  Card(
                      color: greenColor,
                      child: ListTile(
                        title: Text("Sholat Dzuhur",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: backColor)),
                        subtitle: Text(
                            "${prayerTimes.dhuhr!.toLocal().hour}:${prayerTimes.dhuhr!.toLocal().minute}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: backColor)),
                      )),
                  Card(
                      color: greenColor,
                      child: ListTile(
                        title: Text("Sholat Ashar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: backColor)),
                        subtitle: Text(
                            "${prayerTimes.asr!.toLocal().hour}:${prayerTimes.asr!.toLocal().minute}${prayerTimes.asr!.toLocal().minute}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: backColor)),
                      )),
                  Card(
                      color: greenColor,
                      child: ListTile(
                        title: Text("Sholat Magrib",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: backColor)),
                        subtitle: Text(
                            "${prayerTimes.maghrib!.toLocal().hour}:${prayerTimes.maghrib!.toLocal().minute}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: backColor)),
                      )),
                  Card(
                      color: greenColor,
                      child: ListTile(
                        title: Text("Sholat Isya",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: backColor)),
                        subtitle: Text(
                            "${prayerTimes.isha!.toLocal().hour}:0${prayerTimes.isha!.toLocal().minute}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: backColor)),
                      )),
                ]),
              ),
            ],
          ),
        ),
      );
    });
  }
}
