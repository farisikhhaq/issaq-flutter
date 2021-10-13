import 'package:flutter/material.dart';
import 'package:issaq_pro/berita/list_artikel.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Berita'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListArtikel()
          ],),
        ),
      );
}