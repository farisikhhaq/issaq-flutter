import 'package:flutter/material.dart';
import 'package:issaq_pro/model/surat_ayat_model.dart';

class SuratListDetail extends StatefulWidget {
  final String suratId;
  final String suratName;
  final String totalAyat;

  SuratListDetail(this.suratId, this.suratName, this.totalAyat);

  @override
  _SuratListDetailState createState() => _SuratListDetailState();
}

class _SuratListDetailState extends State<SuratListDetail> {
  Future<List<SuratAyat>> _ayatList;

  @override
  void initState() {
    super.initState();
    _ayatList = getSuratAyatData(widget.suratId);
  }

  ListView _suratListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, index) {
        return Card(
          elevation: 8,
          child: _tile(
            data[index].ayatNumber,
            data[index].ayatText,
          ),
        );
      },
    );
  }

  ListTile _tile(
    String ayatNumber,
    String ayatText,
  ) =>
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1, color: Colors.black),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.amberAccent,
            child: Text(
              '$ayatNumber',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
        title: Text(
          ayatText,
          style: TextStyle(fontSize: 24),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.suratName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<SuratAyat>>(
            future: _ayatList,
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<SuratAyat> data = snapshot.data;
                return _suratListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
