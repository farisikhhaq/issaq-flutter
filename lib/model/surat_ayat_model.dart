import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SuratAyat {
  final String ayatNumber;
  final String ayatText;
  final bool sajda;

  SuratAyat({
    required this.ayatNumber,
    required this.ayatText,
    required this.sajda,
  });

  factory SuratAyat.createSuratAyatData(Map<String, dynamic> json) {
    return SuratAyat(
      ayatNumber: json['numberInSurat'].toString(),
      ayatText: json['text'],
      sajda: json['sajda'],
    );
  }
}

Future<List<SuratAyat>> getSuratAyatData(String suratId) async {
  final apiUrl =
      'http://api.alquran.cloud/v1/surah/$suratId/editions/quran-uthmani';
  final response = await http.get(Uri.parse(apiUrl));
  List result = json.decode(response.body)['data'][0]['ayahs'];

  return result.map((ayat) => new SuratAyat.createSuratAyatData(ayat)).toList();
}
