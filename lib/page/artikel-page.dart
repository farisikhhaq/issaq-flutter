import 'package:flutter/material.dart';
import 'package:issaq_pro/berita/list_artikel.dart';
import 'package:issaq_pro/theme.dart';

class ArtikelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'Artikel',
            style: TextStyle(fontFamily: 'sans-serif', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: greenColor1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[ListArtikel()],
          ),
        ),
      );
}
