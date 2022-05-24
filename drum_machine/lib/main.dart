import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  final oynatici = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DR(),
      ),
    );
  }
}

class DR extends StatelessWidget {
  final oynatici = AudioCache();

  void SesiCal(String ses) {
    oynatici.play('$ses.wav');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildExpanded(
                'bongo', 'woo', 'bongo', 'woo', Colors.yellow, Colors.red),
            buildExpanded('clap2', 'clap3', 'clap2', 'clap3', Colors.blueGrey,
                Colors.white),
            buildExpanded('bip', 'clap1', 'bip', 'clap1', Colors.green[900],
                Colors.brown[900]),
            buildExpanded(
                'crash', 'how', 'crash', 'how', Colors.pink[900], Colors.cyan),
          ],
        ),
      ),
    );
  }

  // CODE REFACTORING************************************************

  Expanded buildExpanded(String ses, String ses2, String butonAd,
      String butonAd2, Color renk, Color renk2) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: buildDrumpPad(ses, butonAd, renk),
          ),
          Expanded(
            child: buildDrumpPad(ses2, butonAd2, renk2),
          ),
        ],
      ),
    );
  }

  FlatButton buildDrumpPad(String ses, String butonKelime, Color renk) {
    return FlatButton(
      padding: EdgeInsets.all(8),
      child: Container(
        child: Center(
          child: Text(
            '$butonKelime',
            style: TextStyle(fontSize: 20.00),
          ),
        ),
        color: renk,
      ),
      onPressed: () {
        SesiCal('$ses');
      },
    );
  }
}
//*****************************************************************************
