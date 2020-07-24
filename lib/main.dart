import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XyloFartoPhone());

class XyloFartoPhone extends StatefulWidget {
  @override
  _XyloFartoPhoneState createState() => _XyloFartoPhoneState();
}

class _XyloFartoPhoneState extends State<XyloFartoPhone> {
  bool isXyloPhone = true;

  @override
  final player = AudioCache();

  void playSound(int num){
    player.play('note$num.wav');
  }

  void playFart(int num){
    player.play('fart$num.wav');
  }

  Widget buildKey(int soundNumber, Color colorName){
    return Expanded(
      child: FlatButton(
        color: isXyloPhone ? colorName: Colors.yellow[soundNumber*100+200],
        onPressed: () {
         if(isXyloPhone)
            playSound(soundNumber);
         else
           playFart(soundNumber);
        },
      ),
    );
  }
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.redAccent),
              buildKey(2, Colors.orangeAccent),
              buildKey(3, Colors.yellowAccent),
              buildKey(4, Colors.greenAccent),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blueAccent),
              buildKey(7, Colors.purple),
              FloatingActionButton(
                child: isXyloPhone? Icon(Icons.mood): Icon(Icons.music_note),
                onPressed: (){
                  setState(() {
                    isXyloPhone = ! isXyloPhone;
                  });
                },
              )

            ],
          ),

        ),

      ),
    );
  }
}


