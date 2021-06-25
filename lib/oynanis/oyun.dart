import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/oynanis/sonuc.dart';
import 'dart:async';
import 'package:ingilizcekelimebulma_fy/services/db_Gorev.dart';
import 'package:ingilizcekelimebulma_fy/models/Gorev.dart';
DbUtils utils = DbUtils();

var sorular = [
  {
    'cevap': 'car',
    'resim':
        'https://i.insider.com/578e9e4588e4a77c708b8db1?width=750&format=jpeg&auto=webp'
  },
  {
    'cevap': 'apple',
    'resim':
        'https://post.healthline.com/wp-content/uploads/2020/09/Do_Apples_Affect_Diabetes_and_Blood_Sugar_Levels-732x549-thumbnail-1-732x549.jpg'
  },
  {
    'cevap': 'door',
    'resim':
        'https://lifestyle.prod.content.iproperty.com/news/wp-content/uploads/sites/3/2020/06/01120243/133308637_m.jpg'
  },
  {
    'cevap': 'key',
    'resim': 'https://media.kasperskydaily.com/wp-content/uploads/sites/92/2020/08/25144554/spikey-attack-featured.jpg'
  },
  {
    'cevap': 'horse',
    'resim':
        'https://mk0nationaltodayijln.kinstacdn.com/wp-content/uploads/2019/12/national-horse-day-640x514.jpg'
  },
  {
    'cevap': 'cow',
    'resim':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Cow_female_black_white.jpg/1200px-Cow_female_black_white.jpg'
  },
  {
    'cevap': 'dog',
    'resim':
        'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-1100x628.jpg'
  },
  {
    'cevap': 'clock',
    'resim':
        'https://images.eq3.com/product-definitions/cjuedn73z05650162zt3g6fu8/instance/cjv6ukkqm02p30118culhn925/THUMBNAIL/4ad0d9c2-7dc6-40cc-9a61-df08bcce4e0e.jpg'
  },
  {
    'cevap': 'computer',
    'resim':
        'https://media.istockphoto.com/photos/old-white-desktop-pc-computer-with-a-keyboard-and-mouse-picture-id186598267?k=6&m=186598267&s=170667a&w=0&h=tgCypB3qdG4tmVLpVdTA6ldX9boaIS0IzZWZYZ-ENdU='
  },
  {
    'cevap': 'ball',
    'resim': 'https://www.soccerbible.com/media/95112/2-ucl-19-20-ball.jpg'
  }
];
int sayi = 0;
String isim = "fatih";

class oyun extends StatefulWidget {
  @override
  _oyunState createState() => _oyunState();
}

class _oyunState extends State<oyun> {
  List<Gorev> gorevList = [];



  int ilerle=-1;






  void getData() async {

    await utils.gorevler().then((result) => {
    if (this.mounted) {
      setState(()  {
        gorevList = result;
      })
    }

    });
    print(gorevList);
    ilerle=gorevList[0].ilerleme;

  }
  TextEditingController inputcontroller = new TextEditingController();
  String getValue;
  @override
  Timer _timer;
  int saniye = 0;
  int dakika = 0;
  int puan = 0;

  void initState() {
    getData();
    super.initState();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (this.mounted) {
        setState(() {
          if (saniye == 60) {
            saniye = -1;
            dakika++;
          }
          saniye++;
        });
      }

    });
  }

  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    void _showDialog(text, text2) {

      showDialog(
        context: context,
        builder: (BuildContext context) {

          return AlertDialog(
            title: new Text('$text'),
            content: new Text("$text2"),
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

    String _Gcevap = 's';
    String nick = '';
    var data = [];
    var datasonuc = [];
    data = ModalRoute.of(context).settings.arguments;
    nick = data[0];
    _timer.isActive;
    Future<void> bitis() async {
      if(ilerle==-1){
        var fido1 = Gorev(
          id: 3,
          ilerleme:1,

        );
        await utils.insertGorev(fido1);
      }
      else{
        ilerle=ilerle+1;
        var fido = Gorev(
          id: 3,
          ilerleme:ilerle,

        );
        await utils.updateGorev(fido);
      }


    }
    void kontrol() {
      FocusScope.of(context).requestFocus(FocusNode());
      getValue.toLowerCase();
      if (getValue == sorular[sayi]['cevap']) {
        _showDialog('Tebrikler Doğru Yanıt', '+100 puan');
        puan = puan + 100;
        if (sayi == 9) {
          bitis();
          if (dakika < 2) {
            puan = puan + 400;
          }
          if (dakika > 6) {
            puan = puan - 200;
          }
          datasonuc.add(nick);
          datasonuc.add(puan);
          datasonuc.add(dakika);
          datasonuc.add(saniye);
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => sonuc(),
                settings: RouteSettings(
                  arguments: datasonuc,
                ),
              ));
          // _showDialog('Bitti kanka');
          sayi = -1;
        }
        sayi++;
        isim = sorular[sayi]['soru'].toString();
      } else {
        _showDialog('Yanlış bildiniz', '-20 puan');
        puan = puan - 20;
      }
    }


    void _cevapkaydet(text) {
      _Gcevap = text;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kelimeleri Bul',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [

            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(sorular[sayi]['resim']))),
                  ),
                )),
            Container(



                child: Column(

                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '$nick',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '$puan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '$dakika' + '.' + '$saniye',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              (sayi + 1).toString() +
                                  '/' +
                                  (sorular.length).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ]),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextField(
                              controller: inputcontroller,
                              onChanged: (text) {
                                _cevapkaydet(text);
                              },
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(21.0),
                                )),
                                filled: true,
                                fillColor: Colors.amber.shade50,
                                hintText: "Cevabınız",
                              ),
                            ),
                          ))
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            color: Colors.amber,
                            child: Text('Tahmin Et'),
                            onPressed: () {
                              if (this.mounted) {
                                setState(() {
                                  getValue = inputcontroller.text.toLowerCase();
                                  inputcontroller.clear();
                                });
                              }

                              kontrol();
                            },
                          ),
                        ])
                  ],
                )),

          ],
        ));
  }
}
