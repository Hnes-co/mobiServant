//class for zooming text
import 'package:flutter/material.dart';
import 'package:mobi_servant/main.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
        title: const Text('Käyttöohjeet'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Tervetuloa MobiServantin käyttäjäksi!",
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.bold)),
                  Text(
                      "Tämän ruudun alareunasta löytyvillä painikkeilla voit suurentaa tai pienentää tätä tekstiä. Alapalkin koti-napista pääset palaamaan takaisin aloitusnäkymään.",
                      style: TextStyle(fontSize: fontSize)),
                  Text(
                      "Aloitusnäkymästä pääsee kolmeen eri toimintoon: Suurenna teksti, Lue ääneen, ja Etsi sijainti.",
                      style: TextStyle(fontSize: fontSize)),
                  Text(
                      "- Suurenna teksti -toiminnolla voit suurentaa mitä tahansa tekstiä jonka laitteesi kamera näkee. Kuvattua tekstiä voi suurentaa tai pienentää ruudulla olevien painikkeiden avulla.",
                      style: TextStyle(fontSize: fontSize)),
                  Text(
                      "- Lue ääneen -toiminnolla laitteesi lukee sinulle ääneen minkä tahansa tekstin jonka laitteesi kamera näkee. Lukeminen tapahtuu Lue ääneen -painiketta painamalla.",
                      style: TextStyle(fontSize: fontSize)),
                  Text(
                      "- Etsi sijainti -toiminnolla voit kuvata laitteesi kameralla minkä tahansa paperille kirjoitetun osoitteen, ja puhelimesi hakee reittiohjeet kyseiseen paikkaan.",
                      style: TextStyle(fontSize: fontSize)),
                  Text(
                      "Jos jokin yllämainituista toiminnoista ei toimi, varmista että laitteesi kamera näkee tekstin riittävän hyvin ja sen jälkeen yritä uudelleen.",
                      style: TextStyle(fontSize: fontSize)),
                ],
              ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: 'Päänäkymään',
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MainMenu()));
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
