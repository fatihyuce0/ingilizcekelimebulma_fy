import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/trceviri.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/kelimekle.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/dowlandpdf.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/dowlandmp4.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/haber.dart';
class egitimenu extends StatefulWidget {
  @override
  _egitimenuState createState() => _egitimenuState();
}

class _egitimenuState extends State<egitimenu> {








  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Eğitim Menü"),
      ),


      body: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage('assets/egitim.jpg'))),
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
                          "Eğitim Menü",
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
                            Icons.school,
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
                            child: Text('Çeviri'),


                            onPressed:  () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      trceviri()));
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
                          child: Text('Haber'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    haber()));
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
                          child: Text('Kelime Ekle'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    kelimekle()));
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
                          child: Text('Eğitici Pdfler'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    dowlandpdf()));
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
                          child: Text('Eğitici Videolar'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    dowlandmp4()));
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