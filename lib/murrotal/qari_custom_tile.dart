import 'package:flutter/material.dart';
import 'package:issaq_pro/model/qari.dart';
import 'package:issaq_pro/utils/theme.dart';
// import 'package:flutter_quran_app/model/qari.dart';

class QariCustomTile extends StatefulWidget {
  const QariCustomTile({Key? key ,required this.qari,required this.ontap}) : super(key: key);
  final Qari qari;
  final VoidCallback ontap;

  @override
  _QariCustomTileState createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          //alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: boxColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0,1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.qari.name!,textAlign: TextAlign.start,
                style: blacksPoppins.copyWith(fontSize: 18, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
