//class for handling reading text out loud
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mobi_servant/ocr_class.dart';
import 'package:mobi_servant/main.dart';
import 'package:mobi_servant/ohjeet.dart';

class ReadText extends StatefulWidget {
  const ReadText({Key? key}) : super(key: key);

  @override
  _ReadTextState createState() => _ReadTextState();
}

class _ReadTextState extends State<ReadText> {
  OcrClass ocr = OcrClass(fontSize: 12.0);
  final flutterTts = FlutterTts();

  void speak() async {
    String text = ocr.getText();
    await flutterTts.speak(text);
  }

  @override
  void deactivate(){
    super.deactivate();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ääneenluku')),
      body: Column(children: <Widget>[
        Expanded(
          child: ocr,
        ),
        ReadTextButton(onPressed: speak)
      ]),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            tooltip: 'Päänäkymään',
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MainMenu()));
            },
          ),
          IconButton(
            tooltip: 'Ohjeita',
            icon: const Icon(Icons.help, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HelpPage()));
            },
          ),
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class ReadTextButton extends StatelessWidget {
  const ReadTextButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(3.0),
        //width: double.infinity,
        child: OutlinedButton.icon(
          label: const Text('Lue ääneen'),
          icon: const Icon(Icons.record_voice_over),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 241, 247, 169),
          ),
        ),
      ),
    );
  }
}
