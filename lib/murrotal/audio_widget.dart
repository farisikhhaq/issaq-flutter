import 'package:flutter/material.dart';
import 'package:issaq_pro/model/qari.dart';
import 'package:issaq_pro/services/api_services.dart';
import 'package:issaq_pro/murrotal/qari_custom_tile.dart';
import 'package:issaq_pro/utils/theme.dart';
import 'audio_surah_screen.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({Key? key}) : super(key: key);

  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 12,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: RichText(
                  text: TextSpan(
                      children:[
                        TextSpan(text: 'Murrotal Al-Quran',style: blacksPoppins.copyWith(fontSize: 28, fontWeight: FontWeight.bold )),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1,
                        spreadRadius: 0.0,
                        offset: Offset(0,1),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8,bottom: 4),
                child: Text('Daftar Qari : ',style: blacksPoppins.copyWith(color: Colors.black, fontSize: 20),),
              ),
              SizedBox(height: 10,),
              Expanded(                
                child: FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (BuildContext context , AsyncSnapshot<List<Qari>> snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Data Qari Tidak Ditemukan '),);
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    return ListView.builder(                
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context , index){
                        return QariCustomTile(qari: snapshot.data![index],
                        ontap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context)=>
                                  AudioSurahScreen(qari: snapshot.data![index])));
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
