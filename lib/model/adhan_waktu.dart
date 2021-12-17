import 'package:adhan_dart/adhan_dart.dart';

adzanwaktu() {
  Coordinates coordinates = Coordinates(-7.983908, 112.621391);
  DateTime date = DateTime.now();
  CalculationParameters params = CalculationMethod.Dubai();
  PrayerTimes prayerTimes =
      PrayerTimes(coordinates, date, params, precision: true);
  DateTime? fajrTime = prayerTimes.fajr!.toLocal();
  print(fajrTime);
  double degree = Qibla.qibla(coordinates);
  print(degree);
}

var adzanbulan = [
  "Januari",
  "Februari",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Agustus",
  "September",
  "Oktober",
  "November",
  "Desember"
];