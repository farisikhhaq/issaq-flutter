import 'package:flutter/material.dart';
import 'package:issaq_pro/quran/surat_list.dart';
import 'package:issaq_pro/utils/theme.dart';

class QuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Quran'),
          centerTitle: true,
          backgroundColor: greenColor1,
        ),body:Container(child:SuratList())
      );
}


