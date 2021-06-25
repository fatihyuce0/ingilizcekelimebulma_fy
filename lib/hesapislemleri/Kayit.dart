import 'package:flutter/material.dart';
import 'file:///C:/Users/fatih/AndroidStudioProjects/ingilizcekelimebulma_fy/lib/main.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/dogrulama.dart';

class kayit extends StatefulWidget {
  @override
  _kayitState createState() => _kayitState();
}

class _kayitState extends State<kayit> {
 int a=-1;
  String kadi="";
  String ksifre="";
  String mail="";
  String hayvan="";
  var status=false;
  void _boskontrol(){
    if(kadi==""||ksifre==""||mail==""||hayvan==""||a==-1){
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
  final TextEditingController _t1 = TextEditingController();
  final TextEditingController _t2 = TextEditingController();
  final TextEditingController _t3 = TextEditingController();
  final TextEditingController _t4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _t1.addListener(() {
      _kadiKaydet(_t1.text);
      _boskontrol();
    });
    _t2.addListener(() {
      _ksifreKaydet(_t2.text);
      _boskontrol();

    });
    _t3.addListener(() {
      _mailKaydet(_t3.text);
      _boskontrol();

    });
    _t4.addListener(() {
      _hayvanKaydet(_t4.text);
      _boskontrol();

    });

  }

  @override
  void dispose() {
    _t1.dispose();
    _t2.dispose();
    _t3.dispose();
    _t4.dispose();
    super.dispose();
  }


  @override

  Widget build(BuildContext context) {
    var logo=Icons.panorama_fish_eye;
    var renk=Colors.red;





    if (ModalRoute.of(context).settings.arguments !=
        null) {

      var data=[];
      data=ModalRoute.of(context).settings.arguments;
     _t1.text=data[1];
      _t2.text=data[2];
      _t3.text=data[3];
      _t4.text=data[4];


      if(data[0]==1){
       a=data[0];
       logo=Icons.check_circle_outline;
       renk=Colors.green;
       _boskontrol();
      }

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
                        controller: _t1,



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
                        controller: _t2,

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
                        controller: _t3,
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
                        controller: _t4,
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
                    child:TextButton.icon(

                      icon: Icon(logo,color: renk,),
                      label: Text("Robot Musun?(Doğrulamak İçin Tıklayınız)",style: TextStyle(
                        color: Colors.white,
                      ),),
                      onPressed: () {

                        var data=[];
                        data.add(_t1.text);
                        data.add(_t2.text);
                        data.add(_t3.text);
                        data.add(_t4.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => dogrulama(),
                              settings:RouteSettings(
                                arguments: data,
                              ),

                            )
                        );
                      },
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
                        print("$kadi");
                        print("$ksifre");
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
