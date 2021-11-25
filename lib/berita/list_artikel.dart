import 'package:flutter/material.dart';
import 'package:issaq_pro/model/artikel_islami.dart';
import 'package:issaq_pro/utils/custom_color.dart';
import 'detail_artikel.dart';
import 'package:issaq_pro/theme.dart';

class ListArtikel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 603,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: dataArtikelIslam.map((place) {
                return RaisedButton(
                  elevation: 0,
                  color: backColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder:
                                (context, animation, animationTime, child) {
                              animation = CurvedAnimation(
                                  parent: animation, curve: Curves.elasticOut);
                              return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.center,
                                  child: child);
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return DetailArtikel(artikelIslami: place);
                            }));
                  },
                  child: Card(
                    color: greenColor,
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(place.image),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place.title,
                                  style: styleTitle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      size: 20,
                                    ),
                                    Text(
                                      place.date,
                                      style: TextStyle(
                                          fontFamily: 'komik', fontSize: 12, color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.perm_identity, size: 20),
                                    Expanded(
                                      child: Text(
                                        place.author,
                                        style: TextStyle(
                                            fontFamily: 'komik', fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  place.description,
                                  maxLines: 2,
                                  style: TextStyle(fontFamily: 'komik', color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
