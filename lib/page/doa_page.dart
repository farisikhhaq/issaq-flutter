import 'package:flutter/material.dart';
import 'package:issaq_pro/doa/list_doa.dart';
// import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class DoaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // drawer: NavigationDrawerWidget(),
       /*  appBar: AppBar(
          title: Text(
            'Doa',
            style: TextStyle(fontFamily: 'sans-serif', color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[200],
        ), */
        body: Container(child: ListDoa()),
      );
}
