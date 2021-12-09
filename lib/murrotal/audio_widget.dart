import 'package:flutter/material.dart';
import 'package:issaq_pro/model/qari.dart';
import 'package:issaq_pro/services/api_services.dart';
import 'package:issaq_pro/murrotal/qari_custom_tile.dart';
import 'package:issaq_pro/theme.dart';
import 'audio_surah_screen.dart';
// import 'package:flutter_quran_app/model/qari.dart';
// import 'package:flutter_quran_app/services/api_services.dart';
// import 'package:flutter_quran_app/view/audio_surah_screen.dart';
// import 'package:flutter_quran_app/widgets/qari_custom_tile.dart';


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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [                      
                      Text('Search', style: blacksPoppins.copyWith(fontSize: 10),),
                      Spacer(),                      
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8,bottom: 4),
                child: Text('List of 20 Qari\'s : ',style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Expanded(                
                child: FutureBuilder(
                  future: apiServices.getQariList(),
                  builder: (BuildContext context , AsyncSnapshot<List<Qari>> snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Qari\'s data not found '),);
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

                    // return GridView.builder(
                    //   gridDelegate:
                    //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    //   itemCount: snapshot.data!.length,
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) {
                    //     return QariCustomTile(
                    //         qari: snapshot.data![index],
                    //         ontap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => AudioSurahScreen(
                    //                       qari: snapshot.data![index])));
                    //         });
                    //   },
                    // );
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
