class DzikirSholat {
  String arabic, title, translate;
  DzikirSholat({
    required this.arabic,
    required this.title,
    required this.translate,
  });
}

var dzikirSetelahSholatList = [
  DzikirSholat(
      translate:
          '"Aku mohon ampun kepada Allah, Aku mohon ampun kepada Allah, Aku mohon ampun kepada Allah"',
      title: 'Istighfar',
      arabic:
          'أَسْتَغْفِرُ اللًّهَ , أَسْتَغْفِرُ اللًّهَ , أَسْتَغْفِرُ اللًّهَ'),
  DzikirSholat(
    translate:
        '"Ya Allah, Engkau adalah Maha Pemberi keselamatan dan keselamatan hanyalah dari-Mu, Mahaberkah Engkau, wahai Pemilik Keagungan dan Kemuliaan"',
    title: 'Doa keselamatan',
    arabic:
        'اللَّهُمَّ أَنْتَ السَّلاَمُ وَمِنْكَ السَّلاَمُ تَبَارَكْتَ ذَا الْجَلاَلِ وَالإِكْرَامِ',
  ),
  DzikirSholat(
      translate:
          '"Tiada Tuhan selain Allah yang Maha Esa, tiada sekutu bagiNya. Kerajaan dan pujian hanyalah milik-Nya, dan Dia Mahakuasa atas segala sesuatu. Ya Allah, tidak ada yang dapat menolak apa yang Engkau berikan dan tidak ada yang dapat memberi apa yang Engkau tolak. Juga tidak bermanfaat orang kaya (tanpa amal), dari-Mu segala kekayaan."',
      title: 'Membaca dzikir ini',
      arabic:
          'اَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ، اَللَّهُمَّ لاَ مَانِعَ لِمَا أَعْطَيْتَ، وَلاَ مُعْطِيَ لِمَا مَنَعْتَ، وَلاَ يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُِّ'),
  DzikirSholat(
    translate:
        '"Allah tidak ada Tuhan melainkan Dia yang Maha Kekal lagi terus menerus mengurus makhlukNya, tidak mengantuk dan tidak tidur KepunyaanNya apa yang di langit dan di bumi. Siapakah yang dapat memberi syafa’at di sisi Allah tanpa izinNya? Allah mengetahui apa-apa yang di hadapan mereka dan di belakang meraka, dan mereka tidak mengetahui apa-apa dari ilmu Allah melainkan apa yang dikehendakiNya. Kursi Allah meliputi langit dan bumi, Dan Allah tidak merasa berat memelihara keduanya, dan Allah Maha Tinggi lagi Maha Besar."',
    title: 'Ayat kursi',
    arabic:
        'اللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيم',
  ),
  DzikirSholat(
      translate:
          '"Maha suci Allah" \n "Segala puji bagi Allah"\n "Allah Maha Besar"',
      title: 'Tasbih 33x, Tahmid 33x, Takbir 33x',
      arabic: ' سُبْحَانَ اللَّهِ \nالْحَمْدُ لِلَّهِ \nاللَّهُ أَكْبَرُ  '),
  DzikirSholat(
      translate:
          '"Tiada Tuhan selain Allah yang Maha Esa, tiada sekutu bagiNya. Kerajaan dan pujian hanyalah milik-Nya, dan Dia Mahakuasa atas segala sesuatu."',
      title: 'Membaca Dzikir',
      arabic:
          ' اَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ'),
  DzikirSholat(
      translate:
          '"Tiada Tuhan selain Allah yang Maha Esa, tiada sekutu bagiNya. Kerajaan dan pujian hanyalah milik-Nya, dan Dia Mahakuasa atas segala sesuatu."',
      title: 'Membaca Dzikir',
      arabic:
          ' اَ إِلَـهَ إِلاَّ اللهُ وَحْدَهُ لاَ شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرُ'),
  DzikirSholat(
    translate:
        '"Ya Allah, tolonglah aku untuk selalu mengingat-Mu, bersyukur kepada-Mu, dan beribadah dengan baik kepada-Mu"',
    title: 'Doa',
    arabic:
        ' اللَّهُمَّ أَعِنِّى عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَُ',
  ),
];
