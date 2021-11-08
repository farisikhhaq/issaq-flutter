import 'package:flutter/material.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:issaq_pro/model/translation.dart';
import 'package:issaq_pro/services/api_services.dart';
import 'package:issaq_pro/widgets/custom_translation.dart';
import 'package:issaq_pro/const/constants.dart';
import 'package:issaq_pro/widgets/custom_translation.dart';
import 'package:issaq_pro/quran/surah_detail.dart';


class QuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'Quran',
            style: TextStyle(fontFamily: 'sans-serif', color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[200],
        ),
        body: Container(child: Surahdetail()),
}


