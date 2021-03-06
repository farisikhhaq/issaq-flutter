import 'package:flutter/material.dart';
import 'package:issaq_pro/model/qari.dart';
import 'package:issaq_pro/model/surah.dart';
import 'package:issaq_pro/services/api_services.dart';
import 'package:issaq_pro/murrotal/audio_screen.dart';
import 'package:issaq_pro/utils/theme.dart';

class AudioSurahScreen extends StatefulWidget {
  const AudioSurahScreen({Key? key, required this.qari}) : super(key: key);
  final Qari qari;

  @override
  _AudioSurahScreenState createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        elevation: 0,
        title: Text('Daftar Surat', style: blacksPoppins.copyWith(fontSize: 20)),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiServices.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                  itemCount: surah!.length,
                  itemBuilder: (context, index) => AudioTile(
                      surahName: snapshot.data![index].englishName,
                      totalAya: snapshot.data![index].numberOfAyahs,
                      number: snapshot.data![index].number,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AudioScreen(
                                      qari: widget.qari,
                                      index: index + 1,
                                      list: surah,
                                    )));
                      }));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Widget AudioTile(
    {required String? surahName,
    required totalAya,
    required number,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: boxColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 30,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: orangeColor,
              ),
              child: Text((number).toString(),
                  style: blacksPoppins.copyWith(
                      fontSize: 13)),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(surahName!,
                    textAlign: TextAlign.end,
                    style: blacksPoppins.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Total Ayat : $totalAya",
                  style: blacksPoppins.copyWith(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.play_circle_fill,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}
