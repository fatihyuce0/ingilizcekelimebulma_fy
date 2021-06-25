import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/oynanis/oyun.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/Gorevview.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/skortablosu.dart';

class oyunmenu extends StatefulWidget {
  @override
  _oyunmenuState createState() => _oyunmenuState();
}

class _oyunmenuState extends State<oyunmenu> {
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
      appBar: AppBar(
        title: const Text("Oyun Menü"),
      ),


      body: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage('assets/oyun.jpg'))),
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
                          "Oyun Menü",
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
                            Icons.gamepad,
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
                          child: Text('Görev'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    Gorevview()));
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
                          child: Text('Skorlar'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    skortablosu()));
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