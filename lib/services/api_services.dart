import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:issaq_pro/model/qari.dart';
import 'package:issaq_pro/model/surah.dart';
import 'package:issaq_pro/model/translation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices{

  final endPointUrl ="http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];
  List<SurahTranslation> translationList = [];
  List<Qari> qarilist = [];

  Future<List<Surah>> getSurah() async{
    Response res = await http.get(Uri.parse(endPointUrl));
    if(res.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element){
        if(list.length<114) {
          list.add(Surah.fromJson(element));
        }
      });
      print('ol ${list.length}');
      return list;
    }else{
      throw ("Can't get the Surah");
    }
  }

  Future<SurahTranslationList> getTranslation(int index) async{
    final url = "https://quranenc.com/api/translation/sura/urdu_junagarhi/$index";
    var res = await http.get(Uri.parse(url));

    return SurahTranslationList.fromJson(json.decode(res.body));
  }

  Future<List<Qari>> getQariList()async{
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element){
      if(qarilist.length<20)
      qarilist.add(Qari.fromjson(element));
    });
    qarilist.sort((a,b)=>a.name!.compareTo(b.name!));
    return qarilist;
  }

}