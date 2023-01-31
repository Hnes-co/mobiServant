import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobi_servant/read_text.dart';
import 'package:mobi_servant/navigation.dart';
import 'package:mobi_servant/theme/app_theme.dart';
import 'package:mobi_servant/zoom_text.dart';
import 'package:mobi_servant/ohjeet.dart';

void main() {
  runApp(const Mobiservant());
}

class Mobiservant extends StatelessWidget {
  const Mobiservant({Key? key}) : super(key: key);

  static const String _title = "Mobiservant";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const MainMenu(),
      theme: AppTheme.lightTheme,
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MobiServantState();
}

class _MobiServantState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobiServant'),
      ),
      body: const MenuButtons(),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            tooltip: 'Sulje ohjelma',
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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

class MenuButtons extends StatelessWidget {
  const MenuButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 159, 241, 245),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: const [
                    Icon(Icons.zoom_in),
                    Text('Suurenna teksti'),
                  ]),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ZoomText()));
                },
              ),
            ),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 246, 190, 240),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const [
                      Icon(Icons.record_voice_over),
                      Text('Lue ääneen')
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReadText()));
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 241, 247, 169),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const [
                      Icon(Icons.navigation),
                      Text('Etsi sijainti'),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Navigate()));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
