import 'package:flutter/material.dart';
import 'package:issaq_pro/model/surat_model.dart';
import 'package:issaq_pro/quran/surat_list_detail.dart';

class SuratList extends StatefulWidget {
  @override
  _SuratListState createState() => _SuratListState();
}

class _SuratListState extends State<SuratList> {
  Future<List<QuranSurat>> _suratList;

  @override
  void initState() {
    super.initState();
    _suratList = getSuratList();
  }

  ListView _suratListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          child: _tile(
            data[index].id,
            data[index].suratName,
            data[index].suratText,
            data[index].translate,
            data[index].totalAyat,
          ),
        );
      },
    );
  }

  ListTile _tile(
    String id,
    String suratName,
    String suratText,
    String translate,
    String totalAyat,
  ) =>
      ListTile(
        onTap: () => _viewDetail(id, suratName, totalAyat),
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
              '$id',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          '$suratName ($suratText)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$translate ($totalAyat ayat)'),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.amberAccent,
          size: 30,
        ),
      );

  void _viewDetail(String idSurat, String suratName, String totalAyat) {
    // Navigator.of(context).pushNamed('/suratdetail', arguments: idSurat);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuratListDetail(idSurat, suratName, totalAyat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<QuranSurat>>(
            future: _suratList,
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<QuranSurat> data = snapshot.data;
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
