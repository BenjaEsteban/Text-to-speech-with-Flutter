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
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(0.8);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // ignore: prefer_const_constructors
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
            ),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.blue,
            child: ElevatedButton(
                onPressed: () {
                  speak(_textEditingController.text);
                },
                // ignore: prefer_const_constructors
                child: Center(child: Text("Presiona"))),
          ),
          // ignore: prefer_const_constructors
          Spacer(),
        ],
      )),
    );
  }
}
