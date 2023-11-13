import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: TextToSpeech(),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final FlutterTts _flutterTts = FlutterTts();
  TextToSpeech({super.key});

  speak(String text) async {
    await _flutterTts.setLanguage("en-EN");
    await _flutterTts.setPitch(0.1);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        children: [
          // ignore: prefer_const_constructors, avoid_unnecessary_containers
          Container(
            // ignore: prefer_const_constructors
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 400,
                    height: 120,
                  ),
                ),
                Image.asset(
                  'assets/ilustracion.png',
                  width: 280,
                  height: 280,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: 'Ingresa el texto aquí',
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: 100,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  speak(_textEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color.fromRGBO(137, 18, 50, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // ignore: prefer_const_constructors
                child: Center(child: Text("Escuchar"))),
          ),
          // ignore: prefer_const_constructors
          Spacer(),
        ],
      )),
    ));
  }
}
