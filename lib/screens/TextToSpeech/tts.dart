import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'bottom_bar.dart';

class TTSPage extends StatefulWidget {
  const TTSPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> {
  FlutterTts flutterTts = FlutterTts();
  String textToRead = "";
  String selectedLanguage = "es-ES";
  TextEditingController textController = TextEditingController();
  double speechRate = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech'),
        centerTitle: true,
        backgroundColor: const Color(0xFF891232),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/logo.png',
                  width: 400,
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: textController,
                    decoration:
                        const InputDecoration(labelText: 'Ingrese el texto'),
                    onChanged: (text) {
                      setState(() {
                        textToRead = text;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue!;
                  });
                },
                items: <String>[
                  'es-ES',
                  'en-US',
                  'fr-FR',
                  'it-IT',
                  'ja-JA',
                  'ru-RU',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Image.asset(
                          '../assets/flags/${_getFlagImageName(value)}',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        onPlayPressed: _speak,
        onStopPressed: _stop,
        onSpeedChanged: _setSpeechRate,
        speechRate: speechRate,
      ),
    );
  }

  Future<void> _speak() async {
    await flutterTts.setLanguage(selectedLanguage);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(speechRate);

    if (textToRead.isNotEmpty) {
      await flutterTts.speak(textToRead);
    } else {
      _showEmptyTextFieldSnackbar();
    }
  }

  Future<void> _stop() async {
    await flutterTts.stop();
  }

  Future<void> _setSpeechRate(double newRate) async {
    setState(() {
      speechRate = newRate;
    });
    await flutterTts.setSpeechRate(newRate);
  }

  String _getFlagImageName(String languageCode) {
    return '$languageCode.png';
  }

  void _showEmptyTextFieldSnackbar() {
    const snackBar = SnackBar(
      content: Text('El campo de texto está vacío'),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
