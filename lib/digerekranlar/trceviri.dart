import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class trceviri extends StatefulWidget {
  @override
  _trceviriState createState() => _trceviriState();
}

class _trceviriState extends State<trceviri> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  var turkce="";
  var deneme="";
  var ingilizce="";
  var aranacak="ingilizce";
  var bulunacak="turkce";
  var kelime="Çevirilen kelime";
  var degisti="degisti";
  int i=0;
  var baslik="İngilizceden Türkçeye Çeviri";


  yaziEkle(){
    FirebaseFirestore.instance.collection("Konular").doc(t1.text).set({'baslik':t1.text,'icerik':t2.text});

  }
  guncelle(){

  }
  Cevir() async{
    var result = await FirebaseFirestore.instance
        .collection("Kelimeler")
        .where("$aranacak", isEqualTo: t1.text)
        .get();

    setState(() {


      result.docs.forEach((res) {

        print(res.data()['$bulunacak']);
        kelime=res.data()['$bulunacak'];

      });

    });



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Çeviri"),
        ),
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,



        body:Column(
          children: <Widget>[

            Container(

              child: Column(

                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 120,bottom: 30),
                      child:Text("$baslik",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24
                        ),)
                  ),
                  Container(


                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: t1,

                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(21.0),
                              )),
                          filled: true,
                          fillColor: Colors.amber.shade50,
                          hintText: "Çevirelecek kelimeyi giriniz",

                        ),
                      ),
                    ),


                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20,),
                      child:Text("$kelime",


                        style: TextStyle(
                          backgroundColor: Colors.black45,
                            color: Colors.white,
                            fontSize: 24
                        ),)
                  ),





                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: GestureDetector(

                          onDoubleTap: (){
                            setState(() {
                              i++;
                              if(i%2==0){
                                baslik="İngilizceden Türkçeye Çeviri";
                                aranacak="ingilizce";
                                bulunacak="turkce";
                                kelime="Çevirilen kelime";
                              }
                              else{
                                baslik="Türkçeden İngilizceye Çeviri";
                                aranacak="turkce";
                                bulunacak="ingilizce";
                                kelime="Çevirilen kelime";
                              }
                            });
                          },

                          child: RaisedButton(
                            padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            color: Colors.amber,
                            child: Text('Çevir'),
                            onPressed: (){
                              Cevir();
                              
                            },

                          ),
                        ),
                      ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20,bottom: 30),
                      child:Text("Butona hızlıca 2 kez basıldığında çevirinin yönü değişir!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11
                        ),)
                  ),
                  


                ],
              ),
            ),


          ],
        )

    );
  }
}
