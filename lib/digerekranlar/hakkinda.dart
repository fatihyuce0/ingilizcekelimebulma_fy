import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class hakkinda extends StatefulWidget {
  @override
  _hakkindaState createState() => _hakkindaState();
}

class _hakkindaState extends State<hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Hakkında',style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.lightBlue,


      ),
      backgroundColor: Colors.white,

      body:Column(

        children: <Widget>[
          Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://i.pinimg.com/originals/a5/62/1e/a5621e5509b9d9d3f0fab7d600803cb4.jpg'))),
              )),
          Expanded(
            flex: 1,
              child: Container()),

          Expanded(
            flex: 1,
            child: Padding(

            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(

              height: 20  ,
              color: Colors.lightBlue,
              child: Marquee(
                text: "Bu uygulama Dr. Öğretim üyesi Ahmet Cevahir Çınar tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193311009 numaralı Fatih Yüce tarafından 30 Nisan 2021 günü yapılmıştır ",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),

              ),
            ),
          ),),
          Expanded(
            flex: 4,
            child:Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 65),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        color: Colors.lightBlue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                          child: Text('Anasayfaya dön',style:TextStyle(color:Colors.white),),
                        ),
                        onPressed: () {
                          Navigator.pop(context);

                        },
                      ),



                    ],
                  ),
                )
              ],
            )
          ),


        ],

      )

    );
  }
}
