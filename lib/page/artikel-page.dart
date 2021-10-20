import 'package:flutter/material.dart';
import 'package:issaq_pro/berita/list_artikel.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class ArtikelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
         title: Text(
            'Artikel',
            style: TextStyle(fontFamily: 'sans-serif', color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange[400],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListArtikel()
          ],),
        ),
      );
}
