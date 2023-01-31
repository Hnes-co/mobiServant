//class for navigation
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobi_servant/ocr_class.dart';
import 'package:mobi_servant/main.dart';
import 'package:mobi_servant/ohjeet.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  OcrClass ocr = OcrClass(fontSize: 12.0);

  void launchURL() async {
    final regexp = RegExp("[A-Z]\\S* [0-9]{1,3}");
    final match = regexp.firstMatch(ocr.getText());
    String? destination = match?.group(0);
    String url =
        "https://www.google.com/maps/dir/?api=1&destination=" + destination!;
    if (!await launch(url)) throw 'Could not launch $url';
  }
  void newScan() {
    ocr.newScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigoi')),
      body: Column(children: <Widget>[
        Expanded(
            child: ocr
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ReadTextButton(
                  onPressed: launchURL,
                  text: 'Hae reittiohjeet',
                  icon: const Icon(Icons.navigation),
                  color: const Color.fromARGB(255, 241, 247, 169),
                ),
              )
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ReadTextButton(
                    onPressed: newScan,
                    text: 'Skannaa uudestaan',
                    icon: const Icon(Icons.camera_alt),
                    color: const Color.fromARGB(255, 246, 190, 240),
                  ),
                )
            ),
          ],
        )
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

class ReadTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Icon icon;
  final Color color;
  const ReadTextButton({
    Key? key, required this.onPressed, required this.text,
    required this.icon, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(3.0),
        //width: double.infinity,
        child: OutlinedButton.icon(
          label: Text(text),
          icon: icon,
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
