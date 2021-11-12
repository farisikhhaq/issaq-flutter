import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranSurat {
  final String id;
  final String suratName;
  final String suratText;
  final String translate;
  final String totalAyat;

  QuranSurat(
      {required this.id,
      required this.suratName,
      required this.suratText,
      required this.translate,
      required this.totalAyat});

  factory QuranSurat.createSuratList(Map<String, dynamic> json) {
    return QuranSurat(
        id: json['id'].toString(),
        suratName: json['surat_name'],
        suratText: json['surat_text'],
        translate: json['surat_terjemahan'],
        totalAyat: json['count_ayat'].toString());
  }
}

Future<List<QuranSurat>> getSuratList() async {
  try {
    final apiUrl = 'https://quran.kemenag.go.id/index.php/api/v1/surat';
    final response = await http.get(Uri.parse(apiUrl));
    List result = json.decode(response.body)['data'];

    return result
        .map((surat) => new QuranSurat.createSuratList(surat))
        .toList();
  } catch (err) {
    throw err;
  }
}
