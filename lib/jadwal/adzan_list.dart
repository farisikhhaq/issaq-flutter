import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:issaq_pro/model/adhan_waktu.dart';
import 'package:issaq_pro/theme.dart';

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
                          fontFamily: 'Georgia', color: greenColor, fontSize: 22),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                  child: Column(children: <Widget>[
                    Card(
                        child: ListTile(
                      title: Text("${date.day} ${adzanbulan[date.month-1]} ${date.year}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          )),
                      subtitle: Text(
                        "Untuk Wilayah Malang",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Card(
                        color: orangeColor,
                        child: ListTile(
                          title: Text("Sholat Shubuh",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${prayerTimes.fajr!.toLocal().hour} ${prayerTimes.fajr!.toLocal().minute}"),
                        )),
                    Card(
                        color: orangeColor,
                        child: ListTile(
                          title: Text("Sholat Dzuhur",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${prayerTimes.dhuhr!.toLocal().hour} ${prayerTimes.dhuhr!.toLocal().minute}"),
                        )),
                    Card(
                        color: orangeColor,
                        child: ListTile(
                          title: Text("Sholat Ashar",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${prayerTimes.asr!.toLocal().hour} ${prayerTimes.asr!.toLocal().minute}"),
                        )),
                    Card(
                        color: orangeColor,
                        child: ListTile(
                          title: Text("Sholat Magrib",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${prayerTimes.maghrib!.toLocal().hour} ${prayerTimes.maghrib!.toLocal().minute}"),
                        )),
                    Card(
                        color: orangeColor,
                        child: ListTile(
                          title: Text("Sholat Isya",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${prayerTimes.isha!.toLocal().hour} ${prayerTimes.isha!.toLocal().minute}"),
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
