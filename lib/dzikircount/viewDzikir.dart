import 'package:flutter/material.dart';

class Present extends StatelessWidget {
  const Present({
    Key? key,
    required this.awal,
    required this.batasan,
  }) : super(key: key);

  final int awal;
  final int batasan;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        awal.toString() + "/" + batasan.toString(),
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
      ),
    );
  }
}
