# ISSAQ (Information System Shola and Quran)

Jadi ini merupakan aplikasi yang melingkup seputar agama seperti informasi Sholat, Pembacaan Alquran, Doa, Artikle dan Lainnya.

## Pendahuluan

Pada project aplikasi ini saya menggunakan flutter sebagai framework dan bahasa pemograman dart sebagai back-end nya. serta ada beberapa sumber lain sebagai artikle, quran, sholat maupun lainnya. untuk menjalankan aplikasi ini diperlukan beberapa installasi software untuk pengembangannya.

## UPDATE FINAL PROJECT
1. Jadwal Sholat
2. Dzikir Counter
3. Dzikir Bacaan
4. Murrotal
5. Wish List Catatan Quran

### Installasi

1. Melakukan penginstalan chocolatey : https://chocolatey.org/install
2. Melakuan pengintalan dart sebagai berikut di-CMD:
   ```
   C:\src>choco install dart-sdk
   C:\src>choco upgrade dart-sdk
   ```
      - In the Windows search box, type env.
      - Click Edit the system environment variables.
      - Click Environment Variables….
      - In the user variable section, select Path and click Edit…. 
      - Click New, and enter the path to the dart-sdk directory.
      - In each window that you just opened, click Apply or OK to dismiss it and apply the path change
3. Melakukan Penginstalan Flutter SDK : https://flutter.dev/docs/get-started/install
  ```
  C:\src>git clone https://github.com/flutter/flutter.git -b stable
  ```
4. Melakukan Run
 ```
C:\src>flutter doctor
C:\src>flutter run

```
5. Melakukan Installasi Plugins pada VSCode atau pada Android Studio

## Demo Aplikasi GIF

### Demo Sidebar Perpindahan Antar Page
![](gif/bottomnavbar.gif)
   ![](gif/scrollview.gif)

### List View Pada Page Artikel
![](gif/artikelpage.gif)


### List View Pada DOA dan Pergantian Page
![](gif/doapage.gif)

### List View dan API Sinkroniasasi Quran Page
![](gif/quran1.gif)
   ![](gif/quran2scroll.gif)


### Penjelasan

1. Demo Sidebar Perpindahan Antar Page

* Gambar 1 = Demo Antar Page menggunakan Bottom navbar menu berbentuk stack
* Gambar 2 = Melakukan test scroll pada homepage

2. List View Pada Page Artikel

* Gambar 1 = List View berjumlah 10 dan dapat berpindah page dengan adanya pemilihan data melalui detail_artikle.dart menggunakan model yang telah dibuat

3. List View Pada DOA dan Pergantian Page

* Gambar 1 = Menekan  Page doa dan akan menampilkan 8 data model yang telah dibuat dengan berbentuk list cardview

4. API Connect dengan Quran Kemenag
* Gambar 1 = Demo membuka detail quran page pada surah alfatihah
* Gambar 2 = Melakukan test scroll pada quran page untuk mendeteksi bahwa api berhasil berjalan dengan lancar

## In Progress dan Error Saat pengerjaan

* Menunggu Update Lebih Lanjut (INPROGRESS)

## YOUTUBE LINK

* Menunggu Update Lebih Lanjut (INPROGRESS)

## IDENTITAS DIRI
```
FARIS IKHLASUL HAQ
07 / 1941720062
HISYAM HARYO MAHDYAN
10 / 1941720186
IRFAN THALIB ALFARID
11 / 1941720039
```
## DOSEN PENGAMPU
```
Dian Hanifudin Subhi, S.Kom., M.Kom.
https://github.com/dhanifudin
```
## JURUSAN TEKNOLOGI INFORMASI
![](gif/JTI.png)


