//handling ocr and text recognition
//handling ocr and text recognition
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

// ignore: must_be_immutable
class OcrClass extends StatefulWidget {
  final double fontSize;
  late Function getText;
  late Function newScan;

  OcrClass({Key? key, required this.fontSize}) : super(key: key);

  @override
  _OcrClassState createState() => _OcrClassState();
}

class _OcrClassState extends State<OcrClass> {
  final int ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String scannedText = 'TEXT';


  @override
  void initState() {
    super.initState();
    _read();
    widget.getText = () {
      return scannedText;
    };
    widget.newScan = () {
      _read();
    };
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: ocrCamera,
        fps: 30.0,
        waitTap: true,
        multiple: true,
        showText: false,
      );
      setState(() {
        scannedText = texts.map((e) => e.value).join(" ");
      });
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(scannedText, style: TextStyle(fontSize: widget.fontSize),);
  }

}