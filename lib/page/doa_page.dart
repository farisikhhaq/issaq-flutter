import 'package:flutter/material.dart';
import 'package:issaq_pro/doa/list_doa.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class DoaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Doa'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(child: ListDoa()),
      );
}