import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
class sikayet extends StatefulWidget {
  @override
  _sikayetState createState() => _sikayetState();
}

class _sikayetState extends State<sikayet> {
  int _value=1;

  String valueChoose;
  List listItem=[
    "Item 1","Item 2","Item 3"
  ];
  List secenek=[
    "Şikayet","Öneri","Falan"
  ];
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Teşekkürler"),
          content: new Text(
              "Şikayetinizle ilgili çalışma başlatılmıştır"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
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
  String country_id;
  List<String> country = [
    "Soru yanlış",
    "Kullanıcı hile kullanıyor",
    "Fotoğraf uygun değil"
  ];


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
        appBar: AppBar(
          title: const Text("Şikayet"),
        ),
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,



        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Container(

              height: height - 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text("Şikayet türünü seçiniz"
                      ,style: TextStyle(
                          fontSize: 24
                        ),
                      ),
                    ),
                  ),

                  Container(


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(


                              child: DropdownButton(
                                  value: _value,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Uygunsuz fotoğraf"),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Yanlış Soru"),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                        child: Text("Hile kullanan kullanıcı"),
                                        value: 3
                                    ),
                                    DropdownMenuItem(
                                        child: Text("Uygulama hataları"),
                                        value: 4
                                    )
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  }),
              )





                        ],
                      )
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(





                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(21.0),
                                )),
                            filled: true,
                            fillColor: Colors.amber.shade50,
                            hintText: "Şikayetle ilgili detaylı giriniz",

                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(

                    child: RaisedButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      color: Color(0XFF52827b),
                      child: Text('Şikayet et'),
                      onPressed: () {
                        setState(() {
                          _showDialog();

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