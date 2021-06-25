import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class kelimekle extends StatefulWidget {
  @override
  _kelimekleState createState() => _kelimekleState();
}

class _kelimekleState extends State<kelimekle> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  ekle(){
    FirebaseFirestore.instance.collection("Kelimeler").doc(t1.text).set({'ingilizce':t1.text,'turkce':t2.text});

  }
  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: new Text("Tebrikler"),
          content: new Text("Başarıyla kelime eklmeyi gerçekleştirdiniz!!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kelime Ekle"),
        ),
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,



        body:Column(
          children: <Widget>[

            Container(

              child: Column(

                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 150,bottom: 40),
                      child:Text("Çeviriye Kelime Ekleme",
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
                          hintText: "İngilizce kelimeyi girin",

                        ),
                      ),
                    ),


                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20,),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: t2,

                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(21.0),
                                )),
                            filled: true,
                            fillColor: Colors.amber.shade50,
                            hintText: "Türkçe kelimeyi girin",

                          ),
                        ),
                      ),
                  ),





                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),



                        child: RaisedButton(
                          padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                          color: Colors.amber,
                          child: Text('Ekle'),
                          onPressed: (){
                            ekle();
                            _showDialog(context);



                          },

                        ),

                    ),
                  ),



                ],
              ),
            ),


          ],
        )

    );
  }
}
