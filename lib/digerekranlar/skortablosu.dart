import 'package:flutter/material.dart';

class skortablosu extends StatefulWidget {
  @override
  _skortablosuState createState() => _skortablosuState();
}

class _skortablosuState extends State<skortablosu> {


  @override



  Widget build(BuildContext context) {


    int a=2;
    int puan=193311009;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body:Column(
          children: <Widget>[
            Container(
              height: 330.0,
              color: Colors.red.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,




                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(


                        backgroundImage: NetworkImage("https://www.cumhuriyet.com.tr/Archive/2021/4/27/1831302/kapak_091456.jpg"),
                        radius: 120,
                        child: Text("1",
                          style: TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow( // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Colors.black
                              ),
                              Shadow( // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Colors.black
                              ),
                              Shadow( // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Colors.black
                              ),
                              Shadow( // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Colors.black
                              ),
                            ],

                          ),),


                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Fatih Yüce kullancısı")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(puan.toString()+" puana sahip",
                      style: TextStyle(
                        color: Colors.black45
                      ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30))),
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                          child: Text('Geri dön',style:TextStyle(color:Colors.white),),
                        ),
                        onPressed: () {
                          Navigator.pop(context);


                        },
                      ),
                    ],
                  )







                ],

              ),


            ),
            Container(
              height: height-330,
              color: Colors.blue.shade300,
              child:ListView.builder(


                itemCount: 10,

                itemBuilder: (BuildContext context, int index) {



                  return ListTile(


                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/236x/3b/2d/7a/3b2d7a1ba26c1cc596a662b4e4279ad3.jpg",

                      ),
                      child:Text((a++).toString(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                          shadows: [
                      Shadow( // bottomLeft
                      offset: Offset(-1, -1),
                          color: Colors.black
                      ),
                      Shadow( // bottomRight
                          offset: Offset(1, -1),
                          color: Colors.black
                      ),
                      Shadow( // topRight
                          offset: Offset(1, 1),
                          color: Colors.black
                      ),
                      Shadow( // topLeft
                          offset: Offset(-1, 1),
                          color: Colors.black
                      ),
                      ],
                      ),)
                    ),
                    title: Text("Fatih Yüce Kullanıcı",
                    style: TextStyle(

                    ),),

                    subtitle: Text((--puan).toString()+" puana sahip"),

                  );
                },
              ),
            ),

          ],
        )
    );


  }

}

