# FlashCards - Aplicación de estudio con tarjetas

![Estado](https://img.shields.io/badge/estado-en%20desarrollo-yellow)
![Versión](https://img.shields.io/badge/versión-1.0.0-blue)
![Flutter](https://img.shields.io/badge/Flutter-3.7.0+-02569B?logo=flutter)
![Licencia](https://img.shields.io/badge/licencia-MIT-green)

Una aplicación móvil desarrollada con Flutter para estudiar programación y otros temas mediante tarjetas de memoria interactivas.

## 📱 Capturas de pantalla

[Agregar capturas de pantalla de la aplicación aquí]

## 📋 Descripción

FlashCards es una aplicación educativa diseñada para facilitar el aprendizaje de conceptos de programación mediante el uso de tarjetas de memoria interactivas. La aplicación presenta una interfaz intuitiva que permite a los usuarios estudiar diferentes temas, responder preguntas de opción múltiple y recibir retroalimentación inmediata sobre sus respuestas.

## ✨ Características principales

- **Interfaz intuitiva**: Diseño moderno y atractivo con navegación fluida.
- **Múltiples temas**: Categorías de estudio organizadas por tecnologías (Flutter, JavaScript, Python, SQL).
- **Tarjetas interactivas**: Cada tarjeta contiene:
  - Contexto informativo
  - Pregunta específica
  - Opciones de respuesta múltiple
  - Retroalimentación visual al seleccionar una respuesta
- **Evaluación inmediata**: Feedback visual con indicadores de respuesta correcta/incorrecta.
- **Experiencia de aprendizaje adaptativa**: Si la respuesta es incorrecta, la tarjeta se reinicia.
- **Progreso visual**: Indicador de avance que muestra la posición actual en el conjunto de tarjetas.
- **Pantalla de finalización**: Celebración al completar todas las tarjetas de un tema.

## 🛠️ Tecnologías utilizadas

- **Flutter**: Framework de UI para aplicaciones multiplataforma
- **Dart**: Lenguaje de programación
- **Material Design**: Guía de diseño visual
- **Animaciones personalizadas**: Para la interacción con las tarjetas

## 🚀 Instalación

### Prerrequisitos

- Flutter SDK 3.7.0 o superior
- Dart SDK 3.0.0 o superior
- Android Studio / VS Code
- Un emulador o dispositivo físico para pruebas

### Pasos de instalación

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/username/flashcards.git
   cd flashcards
   ```

2. Instalar dependencias:
   ```bash
   flutter pub get
   ```

3. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

## 📁 Estructura del proyecto

```
lib/
├── data/
│   └── topics_data.dart    # Datos de ejemplo para los temas y tarjetas
├── models/
│   ├── flashcard.dart      # Modelo de datos para las tarjetas
│   └── topic.dart          # Modelo de datos para los temas
├── screens/
│   ├── home_screen.dart    # Pantalla principal con lista de temas
│   └── flashcards_screen.dart # Pantalla para ver las tarjetas de un tema
├── widgets/
│   ├── flashcard_widget.dart # Widget para mostrar una tarjeta
│   └── topic_card.dart     # Widget para mostrar un tema en la pantalla principal
└── main.dart               # Punto de entrada de la aplicación
```

## 🧩 Arquitectura

La aplicación sigue una arquitectura por capas:

- **Capa de presentación**: Screens y Widgets que muestran la interfaz de usuario.
- **Capa de datos**: Modelos que definen la estructura de los datos.
- **Capa de lógica de negocio**: Implementada en los Estados (State) de los widgets Stateful.

## 🔄 Flujo de la aplicación

1. El usuario inicia la aplicación y ve la pantalla principal con temas disponibles.
2. Al seleccionar un tema, se navega a la pantalla de flashcards.
3. Cada flashcard muestra primero un contexto; al tocarla, se voltea para mostrar la pregunta con opciones.
4. Al seleccionar una respuesta:
   - Si es correcta: se avanza a la siguiente tarjeta.
   - Si es incorrecta: la tarjeta se reinicia para intentarlo nuevamente.
5. Al completar todas las tarjetas, se muestra un mensaje de felicitación y se regresa a la pantalla principal.

## 🔜 Próximas características

- Implementación de backend para almacenar datos en la nube
- Creación de tarjetas personalizadas por los usuarios
- Sistema de seguimiento de progreso
- Modo offline sincronizable
- Gamificación con puntos y niveles

## 🤝 Contribución

Las contribuciones son bienvenidas. Para contribuir:

1. Haz un Fork del proyecto
2. Crea una rama para tu característica (`git checkout -b feature/amazing-feature`)
3. Haz commit de tus cambios (`git commit -m 'Add some amazing feature'`)
4. Haz Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 📧 Contacto

[SAREZ-MT] 

Link del proyecto: [https://github.com/SAREZ-MT/flashcards](https://github.com/username/flashcards)

---

Desarrollado con ❤️ usando Flutter.
