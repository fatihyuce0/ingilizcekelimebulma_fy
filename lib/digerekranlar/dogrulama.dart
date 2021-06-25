import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/hesapislemleri/kayit.dart';
class dogrulama extends StatefulWidget {
  @override
  _dogrulamaState createState() => _dogrulamaState();
}

class _dogrulamaState extends State<dogrulama> {
  int a=-1;
  void _showDialog() {

    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: new Text("Başarısız"),
          content: new Text("Doğrulama Gerçekleşmedi Tekrar Deneyiniz"),
          actions: <Widget>[

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
    var data = [];
    String kadi="";
    String ksifre="";
    String mail="";
    String hayvan="";
    if (ModalRoute.of(context).settings.arguments !=
        null) {
      data = ModalRoute.of(context).settings.arguments;
      kadi = data[0];
      ksifre = data[1];
      mail=data[2];
      hayvan=data[3];

    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,



        body:Column(
          children: <Widget>[

            Container(
              height: height,
              child: Column(

                children: <Widget>[

                  Container(
                      padding: EdgeInsets.only(top: 80),
                      child:Text("Otobüs içeren görseli seçiniz",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22
                        ),)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            setState(() {
                            a=1;
                          });
                          },

                          child: Container(


                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('https://www.biletbayi.com/Content/ContentItemDocument/images/manload/pamukkale-otobus.jpg'))),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              a=-1;
                            });
                          },
                          child: Container(

                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('https://static.birgun.net/resim/haber-detay-resim/2020/09/03/22-fil-gizemli-sekilde-hayatini-kaybetti-776503-5.jpg'))),
                          ),
                        )

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            a=-1;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://foto.sondakika.com/haber/2018/03/15/trafik-tabelasi-degil-hedef-tahtasi-4-10659066_osd.jpg'))),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            a=-1;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://img.piri.net/mnresize/840/-/resim/imagecrop/2020/05/15/10/13/resized_96bd1-15aa0582001e0628p439043_1203585389_6.jpg'))),
                        ),
                      )
                    ],
                  ),


                  Container(
                    child:RaisedButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      color: Color(0XFF52827b),
                      child: Text('Doğrula'),
                      onPressed: (){
                        if(a==1){
                          var data=[];
                          data.add(1);
                          data.add(kadi);
                          data.add(ksifre);
                          data.add(mail);
                          data.add(hayvan);

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => kayit(),
                                settings:RouteSettings(
                                  arguments: data,
                                ),

                              )
                          );
                        }
                        else{
                          _showDialog();
                        }
                      },


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