import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/oyunmenu.dart';
import 'package:ingilizcekelimebulma_fy/services/db_Gorev.dart';
import 'package:ingilizcekelimebulma_fy/models/Gorev.dart';
DbUtils utils = DbUtils();


class sonuc extends StatefulWidget {
  @override
  _sonucState createState() => _sonucState();
}


class _sonucState extends State<sonuc> {
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

  }
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    var data=[];
    data=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sonuç Ekranı',style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.redAccent,

      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://image.freepik.com/free-vector/congratulations-typography-handwritten-lettering-greeting-card-banner_7081-766.jpg'))),
              )),
          Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Tebrikler '+data[0].toString(),
                              style:TextStyle(
                                color:Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                              )
                            ),
                          )
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Puanınız:"+data[1].toString(),
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:Text(
                              data[2].toString()+' dk '+data[3].toString()+' sn',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),


                            )
                        )
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                              child: Text('Tekrar Oyna',style:TextStyle(color:Colors.white),),
                            ),
                            onPressed: () {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => oyunmenu(),
                                    settings: RouteSettings(
                                      arguments: data,
                                    ),

                                  )
                              );

                            },
                          ),


                        ]),
                  ),

                ],
              ))
        ],
      ),


    );
  }
}
