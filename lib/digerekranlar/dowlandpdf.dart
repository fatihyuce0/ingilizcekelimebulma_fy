import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import'dart:async';
class dowlandpdf extends StatefulWidget {
  @override
  _dowlandpdfState createState() => _dowlandpdfState();
}

class _dowlandpdfState extends State<dowlandpdf> {
  String _filePath = "";
  String link="";
  String dosyadi="";

  Future<String> get _localDevicePath async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }

  Future<File> _localFile({String path, String type}) async {
    String _path = await _localDevicePath;

    var _newPath = await Directory("$_path/$path").create();
    return File("${_newPath.path}/$dosyadi.$type");
  }

  Future _downloadSamplePDF() async {
    final _response = await http.get(Uri.parse(
        "$link"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(path: "pdfs", type: "pdf");
      final _saveFile = await _file.writeAsBytes(_response.bodyBytes);
      print("Dosya yazma işlemi tamamlandı. Dosyanın yolu: ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      print(_response.statusCode);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eğitici Pdfler"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("A1 Seviyesinde Notları İndir"),
              onPressed: () {
                link="https://yabancidiller.medeniyet.edu.tr/documents/yabancidiller/kelime_listeleri/A1.pdf";
                dosyadi="A1";
                _downloadSamplePDF();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("A2 Seviyesinde Notları İndir"),
              onPressed: () {
                link="https://yabancidiller.medeniyet.edu.tr/documents/yabancidiller/kelime_listeleri/A2.pdf";
                dosyadi="A2";
                _downloadSamplePDF();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("B1 Seviyesinde Notları İndir"),
              onPressed: () {
                link="https://yabancidiller.medeniyet.edu.tr/documents/yabancidiller/kelime_listeleri/word_list_CEFR%20B1.pdf";
                dosyadi="B1";
                _downloadSamplePDF();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("English File Elementary İndir "),
              onPressed: () {
                link="https://yabancidiller.medeniyet.edu.tr/documents/yabancidiller/kelime_listeleri/word_list_ENGLISH%20FILE%20ELEMENTARY.pdf";
                dosyadi="FileElemantary";
                _downloadSamplePDF();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_filePath),
            ),
            TextButton.icon(
              icon: Icon(Icons.tv),
              label: Text("İndirilen Dosyayı Göster"),
              onPressed: () async {
                final _openFile = await OpenFile.open(_filePath);
                print(_openFile);
              },
            ),
          ],
        ),
      ),
    );
  }
}


