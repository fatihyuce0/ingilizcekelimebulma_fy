import 'package:flutter/material.dart';
import 'package:ingilizcekelimebulma_fy/data/news_service.dart';
import 'package:ingilizcekelimebulma_fy/models/article.dart';
import 'package:url_launcher/url_launcher.dart';
class haber extends StatefulWidget {

  @override
  _haberState createState() => _haberState();
}

class _haberState extends State<haber> {

  List<Articles> articles = [];

  @override
  void initState() {
    NewsService.getNews().then((value) {
      setState(() {
        articles = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(articles[index].urlToImage),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(articles[index].title),
                        subtitle: Text(articles[index].author),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(articles[index].description),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                              onPressed: () async {
                                await launch(articles[index].url);
                              },
                              child: Text('Go to News')),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}