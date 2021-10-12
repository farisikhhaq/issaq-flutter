import 'package:flutter/material.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Notifikasi'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
      );
}
