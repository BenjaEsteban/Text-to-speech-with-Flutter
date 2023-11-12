# Text To Speech

## Equipo
- **Javier Peña Castro**
  - Rol: Encargado de Diseño
- **Cristobal Rodenas Rodenas**
  - Rol: Arquitecto de Software
- **Benjamín Rodríguez Valenzuela**
  - Rol: Desarrollador Principal

## Caso de Uso
La aplicación está diseñada para ayudar a los usuarios a practicar y mejorar su pronunciación en inglés. Los usuarios podrán ingresar palabras o frases en la aplicación y escuchar cómo se pronuncian correctamente. Para hacer esto posible en Flutter, se ha integrado la funcionalidad de `Text to Speech (TTS)`, que permite la síntesis de voz y la reproducción de las palabras o frases ingresadas.

## Diseño
- **Contenedor de imagenes:**
Se ha incluido un contenedor principal que contiene dos sub-contenedores.

- **Logo:**
Un contenedor separado para el logo con un margen superior de 20 para centrarlo verticalmente.

- **Ilustración:** 
La ilustración también se encuentra dentro del mismo contenedor principal.

- **Campo de Texto para Ingreso:**
Un contenedor separado que ocupa el 80% del ancho total de la pantalla.
Incluye un campo de texto con un padding uniforme de 8.

- **Botón de Escuchar:**
Un contenedor que alberga un botón elevado para activar la síntesis de voz.
El botón tiene un ancho fijo de 100 y una altura fija de 50.
Se ha aplicado un estilo personalizado para el color de fondo y las esquinas redondeadas.

- **Spacer:**
Se ha agregado un spacer para ocupar cualquier espacio restante en la columna y proporcionar un espacio vertical flexible.

- **Maqueta:**
![Imagen diseño](https://github.com/BenjaEsteban/Text-to-speech-with-Flutter/blob/main/assets/design.png)

## Implemenación
### 1. Configuración Inicial
```dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}
```
Importamos las bibliotecas necesarias.
Iniciamos la aplicación con la clase MyApp. 

### 2. Definición de la Clase MyApp
```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: TextToSpeech(),
    );
  }
}
```
- Definimos la clase MyApp como un widget sin estado (StatelessWidget).
- En el método build, configuramos la apariencia de la aplicación y establecemos TextToSpeech() como la pantalla principal.

### 3. Definición de la Clase TextToSpeech
```dart
class TextToSpeech extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final FlutterTts _flutterTts = FlutterTts();

  TextToSpeech({Key? key}) : super(key: key);

  speak(String text) async {
    await _flutterTts.setLanguage("en-EN");
    await _flutterTts.setPitch(0.1);
    await _flutterTts.speak(text);
  }
}
```
- Creamos la clase TextToSpeech como un widget sin estado.
- Creamos instancias de TextEditingController y FlutterTts para manejar el texto del campo y las funciones de texto a voz, respectivamente.
- Implementamos una función speak para convertir el texto a voz.

### 4. Construcción del Widget
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Ingresa el texto a escuchar',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
```
- Usamos un Scaffold como la estructura principal de la pantalla.
- La pantalla está envuelta en SafeArea para garantizar que el contenido no se superponga con áreas sensibles.
- Se utiliza un Column para organizar los elementos verticalmente.

## Arquitectura
### Aquitectura de archivos
- `main.dart`: Archivo principal que inicia la aplicación y define el widget principal `MyApp`.

- Dentro del archivo main se define el widget principal `MyApp` que crea la interfaz de usuario.

- Dentro del archivo main se define el widget `TextToSpeech` que contiene la lógica para la conversión de texto a voz.


### Patrón arquitectónico
El modelo usado en la aplicación es el Modelo Vista Controlador, en donde: 

- Modelo:
En términos de Flutter, el "Modelo" podría representar los datos de la aplicación y la lógica de negocios. En este caso, la clase TextToSpeech contiene dos atributos: _textEditingController y _flutterTts, que podrían considerarse como parte del modelo.
La función speak también realiza una operación relacionada con la lógica de negocios al convertir el texto en voz, y esto también podría considerarse como parte del modelo.

- Vista:
La "Vista" está representada principalmente por el método build de la clase TextToSpeech. Este método define la interfaz de usuario mediante la creación y disposición de widgets.
La jerarquía de widgets dentro del método build define cómo se presentarán los elementos en la pantalla, incluyendo la interfaz de usuario con el TextField, las imágenes, y el botón.

- Controlador:
El "Controlador" se encarga de manejar las interacciones del usuario y actualizar el modelo y la vista en consecuencia. En este caso, el controlador podría considerarse como la función speak que se llama cuando se presiona el botón.
La función speak actualiza el modelo al utilizar la instancia de _flutterTts para llevar a cabo la acción de conversión de texto a voz.

## Aplicación Final 
![Imagen de la aplicación](https://github.com/BenjaEsteban/Text-to-speech-with-Flutter/blob/main/assets/prototipo.png)
