import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  yaziEkle(){
      FirebaseFirestore.instance.collection("Konular").doc(t1.text).set({'baslik':t1.text,'icerik':t2.text});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,



        body:Column(
          children: <Widget>[

            Container(

              child: Column(

                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 80),
                      child:Text("Şifremi Unuttum",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34
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
                          hintText: "Kullanıcı Adınız",

                        ),
                      ),
                    ),


                  ),


                  Container(

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
                          hintText: "Mailiniz",

                        ),
                      ),
                    ),
                  ),
                  Container(

                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(

                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(21.0),
                              )),
                          filled: true,
                          fillColor: Colors.amber.shade50,
                          hintText: "En sevdiğiniz hayvan",

                        ),
                      ),
                    ),
                  ),

                  Container(
                    child:RaisedButton(
                      onPressed: yaziEkle,
                    )
                  ),


                ],
              ),
            ),


          ],
        )

    );
  }
}
