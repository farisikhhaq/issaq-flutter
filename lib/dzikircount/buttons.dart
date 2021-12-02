import 'package:flutter/material.dart';
import 'package:issaq_pro/theme.dart';

class Buttons extends StatelessWidget {
  final Function() tambahButir;
  final int gantiDzikir;
  final Function() kurangiButir;

  Buttons(this.tambahButir, this.gantiDzikir, this.kurangiButir);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: greenColor,
            shape: CircleBorder(),
            onPressed: tambahButir,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          MaterialButton(
            color: Colors.blueGrey,
            shape: CircleBorder(),
            onPressed: gantiDzikir == 0 ? () {} : kurangiButir,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '-',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
