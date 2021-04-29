import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/hesapislemleri/main.dart';

class kayit extends StatefulWidget {
  @override
  _kayitState createState() => _kayitState();
}

class _kayitState extends State<kayit> {
  String kadi="";
  String ksifre="";
  String mail="";
  String hayvan="";
  var status=false;
  void _boskontrol(){
    if(kadi==""||ksifre==""||mail==""||hayvan==""){
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
  void _ksifreKaydet(String text){
    setState(() {
      ksifre=text;
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
                      child:Text("Kayıt",
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
                        obscureText: true,
                        onChanged: (text){
                          setState(() {
                            _ksifreKaydet(text);
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
                          hintText: "Şifreniz",

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
                      child: Text('Kayıt ol'),
                      onPressed: status?() {
                        var data=[];
                        data.add(kadi);
                        data.add(ksifre);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage(),
                              settings:RouteSettings(
                                arguments: data,
                              ),

                            )
                        );

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
