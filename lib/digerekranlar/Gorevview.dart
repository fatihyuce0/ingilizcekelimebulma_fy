import "package:flutter/material.dart";
import 'dart:async';

import 'package:ingilizcekelimebulma_fy/models/Gorev.dart';
import 'package:ingilizcekelimebulma_fy/services/db_Gorev.dart';

DbUtils utils = DbUtils();

class Gorevview extends StatefulWidget {
  @override
  _GorevviewState createState() => _GorevviewState();
}

class _GorevviewState extends State<Gorevview> {
  List<Gorev> gorevList = [];


  final ilerleme=[Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey];
  int a=0;
  int b=0;





  void getData() async {

    await utils.gorevler().then((result) => {
      setState(()  {
        gorevList = result;


      })
    });
    print(gorevList);
    a=gorevList[0].ilerleme;


    for(int i=0;i<a;i++){
      ilerleme[i]=Colors.amber;
    }
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Görevler")),
      body: SingleChildScrollView(
        child: Column(


          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("5 Oyun tamamla",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: ilerleme[0],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: ilerleme[1],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: ilerleme[2],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: ilerleme[3],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: ilerleme[4],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("5 Arkadaşını davet et ",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("5 Değerlendirmede bulun",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text("5 Soru Yükle",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_sharp,size: 40,color: Colors.grey,
                  ),
                ),


              ],
            ),





          ],
        ),
      ),
    );
  }
}