class Surat{

  int? nomor;
  String? nama;
  String? nama_latin;
  String? arti;
  int? jumlah_ayat;
  String? tempat_turun;

  Surat({this.nomor, this.nama, this.nama_latin, this.arti,
      this.jumlah_ayat, this.tempat_turun});

  factory  Surat.fromJson(Map<String,dynamic> json){
    return Surat(
      nomor: json['nomor'],
      nama: json['nama'],
      nama_latin: json['nama_latin'],
      arti: json['arti'],
      jumlah_ayat: json['jumlah_ayat'],
      tempat_turun: json['tempat_turun'],
    );
  }
}