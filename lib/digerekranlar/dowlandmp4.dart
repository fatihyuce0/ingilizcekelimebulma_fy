import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import'dart:async';
class dowlandmp4 extends StatefulWidget {
  @override
  _dowlandmp4State createState() => _dowlandmp4State();
}

class _dowlandmp4State extends State<dowlandmp4> {
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



  Future _downloadSampleVideo() async {
    final _response = await http
        .get(Uri.parse("$link"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(
        path: "mp4s",
        type: "mp4",
      );
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
              label: Text("En Çok Kullanılan İngilizce Kalıplar1"),
              onPressed: () {
                link="https://redirector.googlevideo.com/videoplayback?expire=1624583888&ei=cNrUYJ-1FYjX1gKS_bCQDg&ip=196.245.230.139&id=o-ACQnRaJeGgPUc8kw4y2IouLuO9MSov_BzV4VUlOwaDUK&itag=22&source=youtube&requiressl=yes&mh=Bf&mm=31%2C29&mn=sn-5hneknee%2Csn-5hne6nsz&ms=au%2Crdu&mv=u&mvi=5&pl=24&vprv=1&mime=video%2Fmp4&ns=hdBO8D7rYMwx7TN57dOVblEF&ratebypass=yes&dur=58.258&lmt=1599928197190937&mt=1624475247&fvip=5&fexp=24001373%2C24007246&c=WEB&txp=6216222&n=nnuWad4YmzgHLyYNJl&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgODm6ueD3WjlIif8eMrWc6XSD_U5qxFbB03HYJg7vi2sCIEQ8pDjJORqmP6ClXYMQ-rjlvvIpOn-TmRQHPhuBoZOi&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AG3C_xAwRgIhAImYFd0jBA9yVKlqBQ_o7RDldI3bStxPq6MPjKLqtjmjAiEA-PY3mpGf4bfHw48Kr2A6JkQK-9TJ_ydzuDeBE6frq0c%3D&title=Temel++1++G%C3%BCnl%C3%BCk+Hayatta+En+%C3%87ok+Kullan%C4%B1lan+%C4%B0ngilizce+Kal%C4%B1plar+%21";
                dosyadi="Günlük1";
                _downloadSampleVideo();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("En Çok Kullanılan İngilizce Kalıplar2"),
              onPressed: () {
                link="https://redirector.googlevideo.com/videoplayback?expire=1624584402&ei=ctzUYJvuA9OO7gOzo73YBw&ip=195.123.250.255&id=o-AHGZvf01w84n3r1lHpKAFr8Kixm3m-b-XUMqiEooaIHH&itag=22&source=youtube&requiressl=yes&mh=ya&mm=31%2C29&mn=sn-quxapm-3c2l%2Csn-3c27sn7s&ms=au%2Crdu&mv=u&mvi=1&pcm2cms=yes&pl=24&vprv=1&mime=video%2Fmp4&ns=ABqux1EaSncaT73XnXh_U3gF&ratebypass=yes&dur=74.141&lmt=1600096841953187&mt=1624475805&fvip=17&fexp=24001373%2C24007246&beids=23886205&c=WEB&txp=6216222&n=r7MwJGrVIHBj4co27E&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAL2gmt1uYxWnE1M3O3926sR_sobEPzNhqGTMBuwUY9frAiEAjyeElR-lmlXWIpJSfjZDZOr7psbjXCLXaKD2cb-Qk9I%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpcm2cms%2Cpl&lsig=AG3C_xAwRQIhALDoZJ8zGcKvrGUGZUvBuc6eiRHTHyqHXUPlSK2omGjhAiBR99EZYug5yDxjOQ9nesCs7ukJ8f1Ao9oSxnaMbsxLTA%3D%3D&title=Temel++2++G%C3%BCnl%C3%BCk+Hayatta+En+%C3%87ok+Kullan%C4%B1lan+%C4%B0ngilizce+Kal%C4%B1plar+%21";
                dosyadi="Günlük2";
                _downloadSampleVideo();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("En Çok Kullanılan İngilizce Kalıplar3"),
              onPressed: () {
                link="https://redirector.googlevideo.com/videoplayback?expire=1624584487&ei=x9zUYKnqJIm5gAfH17KYCw&ip=185.182.184.244&id=o-ABm2M2tsl_KjbLcYZJtFjdj_0IoSXdjgFSe1sWC37IhD&itag=22&source=youtube&requiressl=yes&mh=5q&mm=31%2C29&mn=sn-5hne6n7z%2Csn-5hnekn7l&ms=au%2Crdu&mv=u&mvi=5&pl=24&vprv=1&mime=video%2Fmp4&ns=3H4WeARZwTF_v9TkSUud3EwF&ratebypass=yes&dur=101.401&lmt=1600116873040570&mt=1624475805&fvip=5&fexp=24001373%2C24007246&c=WEB&txp=6216222&n=TlRnuM2NpaFiNIj7kX&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgB4keHPW1Zn0NbgxmDCVF-Uw8Mw2XnP4yTZBWNDP8BPICIQCchvdZBZcYfgo0pw3dC2skaAcYmoNf1Is6AQXeO3fPew%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AG3C_xAwRQIgGNWllIJOgyL6eRsCHcTCU152oVb6-bKmg8UpLXuHYdYCIQC-R_e0QPysnb4VQat7NnJ_V9ujSViHfiTCdvjymzq1GA%3D%3D&title=Temel++3++G%C3%BCnl%C3%BCk+Hayatta+En+%C3%87ok+Kullan%C4%B1lan+%C4%B0ngilizce+Kal%C4%B1plar+%21";
                dosyadi="Günlük3";
                _downloadSampleVideo();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.file_download),
              label: Text("Dinleme Egzersizleri "),
              onPressed: () {
                link="https://dl153.dlmate16.xyz/?file=M3R4SUNiN3JsOHJ6WWQ3aTdPRFA4NW1rRVJIODh0QnczZmRxeVJjcURhSldwWWhrOCsydUw4eENLK3dxeXBDbkE4MWQ3ekxkWTluQUVncU92NVlvUjJIS3BaZ3dxV3VKOVljc1hQWmhWd0x3eHFQeHNDaDVuQlBnZk4ySVI1NWJmU00rOFdaZ2xuUzExYVBadUFIOS9YNmlxZ2JPSnlvTnV6Y0NKL2JWenB0QjIyWE9ZdkxiMXBjZnFEU002NEJGMytLVWl3UHp4THN3dHRsbllSWkxXWko2ajd2QzY5bmFzWDRtMDg5TXlnT3B1YmJnQVpzNlFaR3NQekpvTGlzYjdQdm1VUjVEbm5OTXJEbm9vUGgxdUNZYVovMW0valBo";
                dosyadi="Egzersiz";
                _downloadSampleVideo();
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


