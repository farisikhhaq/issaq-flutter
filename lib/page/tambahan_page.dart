import 'package:flutter/material.dart';
import 'package:issaq_pro/widget/navigation_drawer_widget.dart';

class PluginsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Tambahan'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      );
}
