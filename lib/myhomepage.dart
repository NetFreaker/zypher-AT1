import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:zypher/widgets/audio_class.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CurrentBook currentBook;

  bool playing = false;

  AudioPlayer audioPlayer = new AudioPlayer();

  Future _fetchData() async {
    final response = await http.post(
        "https://backend-test-zypher.herokuapp.com/ebooks/getAudioHome");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<AudioClass> _list = [];
      _list.add(AudioClass.fromJson(data));
      return _list;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: FutureBuilder(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                alignment: Alignment.center,
                child: Text('No')
              );
            } else {
        return Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height / 1.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0))
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Icon(Icons.shopping_basket),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 200.0,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-10.0, 8.0),
                              blurRadius: 14
                            )
                          ]
                        ),
                      child: Image.network(snapshot.data[0].audioBooks.currentBook.imageURL),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text( snapshot.data[0].audioBooks.currentBook.productName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0
                  )),
                ],
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(Icons.menu, size: 20.0),
                    )),
                  Icon(Icons.fast_rewind),
                  InkWell(
                      onTap: () {
                        getAudio(snapshot.data[0].audioBooks.currentBook.audioSrcMp3);
                      },
                      child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(14.0))
                      ),
                      child: Icon(playing == false ? Icons.play_arrow : Icons.pause, color: Colors.yellow)
                      ),
                  ),
                  Icon(Icons.fast_forward),
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))
                    ),
                    child: Icon(Icons.audiotrack)), 
                ],
              ),
            ),
            SizedBox(height: 12.0)
          ],
        )
      );
            }
          })
    );
  }
  void getAudio(String audioLink) async{

  var url = audioLink.toString();

  if (playing) {
    var audio = await audioPlayer.pause();
    if(audio ==1){
      setState(() {
        playing =false;
      });
    }
  } else {
    var audio = await audioPlayer.play(url, isLocal: true);
    if(audio ==1){
      setState(() {
        playing =true;
      });
    }
  }
}
}

