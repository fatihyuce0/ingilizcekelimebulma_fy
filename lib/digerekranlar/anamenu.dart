import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/oynanis/oyun.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/hakkinda.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/degerlendirme.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/skortablosu.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/sikayet.dart';
class anamenu extends StatefulWidget {
  @override
  _anamenuState createState() => _anamenuState();
}

class _anamenuState extends State<anamenu> {
  String nick = '';
  var status = true;
  var dataNick = [];
  var data=[];
  int sayi = 0;





  void _baslaKontrol() {

      dataNick.add(nick);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => oyun(),
            settings: RouteSettings(
              arguments: dataNick,
            ),

          )
      );


  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    nick=data[0];
    return Scaffold(


      body: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://palabrus.com/blog/bl-content/uploads/pages/c027632e41773cd94db233b65ad6c2bf/hardest-part-learning-english.jpg'))),
              )),
          Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ana Menü",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.home,
                            color: Colors.amber,
                            size: 30,
                          ))
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              color: Colors.amber,
                              child: Text('Oyna'),


                              onPressed:  () {
                                _baslaKontrol();
                              } ,
                            ),
                          ]),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          color: Colors.amber,
                          child: Text('Şikayet'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    sikayet()));
                          },
                        ),
                      ]

                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          color: Colors.amber,
                          child: Text('Hakkında'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    hakkinda()));
                          },
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          color: Colors.amber,
                          child: Text('Skor Tablosu'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    skortablosu()));
                          },
                        ),
                      ]

                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          color: Colors.amber,
                          child: Text('Değerlendirme'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    degerlendirme()));
                          },
                        ),
                      ]

                  ),


                ],
              ))
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}