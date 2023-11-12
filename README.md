# Aplicación de Texto a Voz en Flutter

Esta es una aplicación de ejemplo en Flutter que utiliza la biblioteca `flutter_tts` para permitir la conversión de texto a voz. La aplicación presenta una interfaz simple que incluye la entrada de texto, imágenes y un botón para activar la función de texto a voz.

## Estructura del Proyecto

- `main.dart`: Archivo principal que inicia la aplicación y define el widget principal `MyApp`.

- `my_app.dart`: Define el widget principal `MyApp` que crea la interfaz de usuario.

- `text_to_speech.dart`: Define el widget `TextToSpeech` que contiene la lógica para la conversión de texto a voz.

## Dependencias

- `flutter/material.dart`: Biblioteca de Flutter para el desarrollo de interfaces de usuario.

- `flutter_tts/flutter_tts.dart`: Biblioteca que proporciona funciones para la síntesis de voz.

## Ejecución de la Aplicación

Para ejecutar la aplicación, asegúrate de tener Flutter y Dart instalados en tu máquina. Luego, ejecuta el siguiente comando en el directorio del proyecto:

```bash
flutter run
```

# Funcionalidades

## Conversión de Texto a Voz
Ingresa el texto deseado en el campo de entrada y presiona el botón "Escuchar" para activar la síntesis de voz.

## Interfaz Amigable
La interfaz incluye imágenes y un diseño simple para una experiencia de usuario mejorada.

# Personalización

Puedes personalizar la aplicación ajustando los siguientes elementos:

- **Cambiar el Idioma de la Síntesis de Voz:**
  Modifica la línea `await _flutterTts.setLanguage("en-EN");` en la función `speak` de `TextToSpeech`.

- **Cambiar la Apariencia del Botón:**
  Modifica las propiedades `color` y `shape` en el contenedor del botón.

- **Personalizar la Interfaz:**
  Añade o modifica elementos en el widget `MyApp` para adaptar la interfaz a tus necesidades específicas.
