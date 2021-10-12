import 'package:flutter/material.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Doa'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
      );
}
