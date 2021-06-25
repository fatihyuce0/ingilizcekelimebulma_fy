import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class hakkinda extends StatefulWidget {
  @override
  _hakkindaState createState() => _hakkindaState();
}


class _hakkindaState extends State<hakkinda> {
  double sayi=200;
  String metin="Anasayfaya dön";
  var renk=Colors.blueAccent;

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
                      GestureDetector(
                        onLongPress: (){
                          setState(() {
                            renk=Colors.redAccent;
                          });
                        },
                        onTap: (){setState(() {
                          Navigator.pop(context);
                        });
                        },

                        onVerticalDragStart: (DragStartDetails details){
                          setState(() {
                            sayi=260;
                          });



                        },
                          onVerticalDragEnd: (DragEndDetails details){
                          setState(() {
                            sayi=200;
                          });


                          },




                        child: Container(
                          width: sayi,
                          height: 40,
                          color: renk,
                          child:Center(child: Text("$metin",style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),)  )
                        )
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
