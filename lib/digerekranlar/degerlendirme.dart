import 'package:flutter/material.dart';
class degerlendirme extends StatefulWidget {
  @override
  _degerlendirmeState createState() => _degerlendirmeState();
}

class _degerlendirmeState extends State<degerlendirme> {
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {


        return AlertDialog(
          title: new Text("Teşekkürler"),
          content: new Text("Uygulamanın gelişimi için değerlendirmeye katıldınız"),
          actions: <Widget>[

            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }




  int i=0;
  String soru=sorular[0]['soru'].toString();

  void kontrol(){
    i++;
    if(i>=5){
      _showDialog();

    }
    else{
      soru=sorular[i]['soru'].toString();
    }




  }

  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;




    return Scaffold(
      appBar: AppBar(
        title: const Text("Değerlendirme"),
      ),
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,



        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Container(

              height: height-80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(



                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[


                          Text("$soru",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),)
                        ],
                      )
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 26),
                    child: Container(

                      child:RaisedButton(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        color: Color(0XFF52827b),
                        child: Text('Evet'),
                        onPressed: () {
                          setState(() {
                            kontrol();
                          });

                        },
                      ),
                    ),
                  ),
                  Container(

                    child:RaisedButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      color: Color(0XFF52827b),
                      child: Text('Hayır'),
                      onPressed: () {
                        setState(() {
                          kontrol();
                        });



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
var sorular=[
  {
    'soru':'Uygulamanının tasarımını beğendiniz mi?'
  },
  {
    'soru':'Uygulama sizi eğlendirdi mi?'
  },
  {
    'soru':'Uygulamanının öğretici mi?'
  },
  {
    'soru':'Uygulamayı yeterli buldunuz mu?'
  },
  {
    'soru':'Uygulama sürükleyici mi?'
  },


];
