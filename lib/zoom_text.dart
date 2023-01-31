//class for zooming text
import 'package:flutter/material.dart';
import 'package:mobi_servant/ocr_class.dart';
import 'package:mobi_servant/main.dart';
import 'package:mobi_servant/ohjeet.dart';

class ZoomText extends StatefulWidget {
  const ZoomText({Key? key}) : super(key: key);

  @override
  _ZoomTextState createState() => _ZoomTextState();
}

class _ZoomTextState extends State<ZoomText> {
  double fontSize = 15.0;
  String scannedText = 'text';

  void zoomInFontSize() async {
    if (fontSize <= 25) {
      setState(() {
        fontSize += 10;
      });
    }
  }

  void zoomOutFontSize() async {
    if (fontSize >= 25) {
      setState(() {
        fontSize -= 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suurenna teksti'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: OcrClass(fontSize: fontSize),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ZoomTextButton(
                    color: const Color.fromARGB(255, 246, 190, 240),
                    buttonText: "Suurenna",
                    icon: const Icon(Icons.zoom_in),
                    onPressed: zoomInFontSize,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: ZoomTextButton(
                      color: const Color.fromARGB(255, 159, 241, 245),
                      buttonText: "Pienennä",
                      icon: const Icon(Icons.zoom_out),
                      onPressed: zoomOutFontSize,
                    )),
              ),
            ],
          ),
        ],
      ),
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

class ZoomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Icon icon;
  final Color color;

  const ZoomTextButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(3.0),
        //width: double.infinity,
        child: OutlinedButton.icon(
          label: Text(buttonText),
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
