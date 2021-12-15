import 'package:flutter/material.dart';
import 'package:issaq_pro/jadwal/adzan_list.dart';

class AdzanPage extends StatelessWidget {
  const AdzanPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: AdzanList()),
    );
  }
}
