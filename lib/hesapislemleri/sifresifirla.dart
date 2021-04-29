import 'package:flutter/material.dart';

class sifresifirla extends StatefulWidget {
  @override
  _sifresifirlaState createState() => _sifresifirlaState();
}

class _sifresifirlaState extends State<sifresifirla> {
  var status=false;
  String kadi="";
  String mail="";
  String hayvan="";
  void _boskontrol(){
    if(kadi==""||mail==""||hayvan==""){
      status=false;
    }
    else{
      status=true;
    }
  }
  void _kadiKaydet(String text){
    setState(() {
      kadi=text;
    });
  }

  void _mailKaydet(String text){
    setState(() {
      mail=text;
    });
  }
  void _hayvanKaydet(String text){
    setState(() {
      hayvan=text;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    void _showDialog() {

      showDialog(
        context: context,
        builder: (BuildContext context) {


          return AlertDialog(
            title: new Text("Şifre Gönderildi"),
            content: new Text("Şifreniz mail aracaılığıyla iletilmiştir."),
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
                        onChanged: (text){
                          setState(() {
                            _kadiKaydet(text);
                            _boskontrol();
                          });



                        },
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
                        onChanged: (text){
                          setState(() {
                            _mailKaydet(text);
                            _boskontrol();
                          });



                        },
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
                        onChanged: (text){
                          setState(() {
                            _hayvanKaydet(text);
                            _boskontrol();
                          });




                        },
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
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      color: Color(0XFF52827b),
                      child: Text('Sıfırla'),
                      onPressed: status?() {
                        setState(() {

                         _showDialog();
                        });



                      }:null,
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
