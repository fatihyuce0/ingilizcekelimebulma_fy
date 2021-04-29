import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/hesapislemleri/Kayit.dart';
import 'package:ingilizcekelimebulma_fy/hesapislemleri/sifresifirla.dart';
import 'package:ingilizcekelimebulma_fy/digerekranlar/anamenu.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color(0XFF252934),
      ),
      home: MyHomePage(title: 'İngilizce Tahmin Oyunu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String kadi = "s";
  String ksifre = "s";
  String kadimain = "";
  String ksifremain = "";
  var status = false;
  var dataNick = [];
  var data = [];

  int sayi = 0;

  void _kadiKaydet(String text) {
    setState(() {
      kadimain = text;
    });
  }

  void _ksifreKaydet(String text) {
    setState(() {
      ksifremain = text;
    });
  }

  void _showDialog() {

    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: new Text("Hatalı giriş"),
          content: new Text("Kullanıcı adı veya şifre hatalı"),
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

  void _baslaKontrol() {
    _showDialog();
    if ((kadimain.toString() == kadi.toString()) && ksifre == ksifremain) {
      dataNick.add(kadi);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => anamenu(),
            settings: RouteSettings(
              arguments: dataNick,
            ),
          ));
    } else {
      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0XFF6daca3),
        resizeToAvoidBottomInset: false,


        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://logodix.com/logo/1713894.jpg'))),
              ),
            ),
            Container(
              height: height - 360,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            _kadiKaydet(text);
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        onChanged: (text) {
                          setState(() {
                            _ksifreKaydet(text);
                            if (ksifremain == "" || kadimain == "") {
                              status = false;
                            } else {
                              status = true;
                            }
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
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(right: 20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => sifresifirla()));
                      },
                      child: Text(
                        'Şifremi Unuttum',
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Color(0XFF52827b),
                      child: Text('Giriş Yap'),
                      onPressed: status
                          ? () {
                              setState(() {
                                if (ModalRoute.of(context).settings.arguments ==
                                    null) {
                                  _showDialog();
                                }
                                else{
                                  data =
                                      ModalRoute.of(context).settings.arguments;
                                  kadi = data[0];
                                  ksifre = data[1];
                                  _baslaKontrol();
                                }

                              });
                            }
                          : null,
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Colors.amber,
                      child: Text('Kayıt Ol'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => kayit()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
